import { Stack, Title, Text, TextInput, PasswordInput, Button, Anchor, Group } from "@mantine/core";
import { useForm, isNotEmpty } from '@mantine/form'
import { IconX } from "@tabler/icons-react";
import { useState } from "react";
import { useAuth } from "../context/AuthContext";
import { api_url } from "../global";

interface SignUpForm {
  username: string;
  password: string;
  confirmPassword: string;
}

export default function SignUp(
  {onLogin, onSuccess}
  : 
  {onLogin: () => void, onSuccess: () => void}
) {
  const [errorStatus, setErrorStatus] = useState('');
  const { login } = useAuth();

  const form = useForm<SignUpForm>({
    mode: 'uncontrolled',
    initialValues: {
      username: '',
      password: '',
      confirmPassword: ''
    },
    validate: {
      username: isNotEmpty('Username is required'),
      password: isNotEmpty('Password is required'),
      confirmPassword: (value, values) => 
        value !== values.password ? 'Passwords do not match' : undefined
    }
  });

  const handleSubmit = async (values: SignUpForm) => {
    const res = await fetch(api_url('/auth/signup'), {
      method: 'POST',
      headers: { 'Content-Type': 'application/json'},
      body: JSON.stringify({
        username: values.username,
        password: values.password
      })
    });

    const data = await res.json();
      
    if(!res.ok) {
      setErrorStatus(data.message);
      return;
    }

    setErrorStatus('');

    login({ id: data.id, username: values.username })
    onSuccess();
  }

  return (
    <Stack px='22' justify="center" ta='center' gap='20'>
      <Title order={1} fw='400' c='violet' ta='center'>
        GameChop
      </Title>
      <Text fw='600' fz='1.5rem' lh='2rem' mt='-10'>
        Create an Account
      </Text>
      <form onSubmit={form.onSubmit(handleSubmit)}>
        <TextInput 
          ta='left'
          label='Username' 
          key={form.key('username')}
          {...form.getInputProps('username')}
          styles={{
            label: { color: 'var(--mantine-color-dimmed)' }
          }}
        />
        <PasswordInput 
          mt='lg'
          ta='left'
          label='Password' 
          key={form.key('password')}
          {...form.getInputProps('password')}
          styles={{
            label: { color: 'var(--mantine-color-dimmed)' }
          }}
        />
        <PasswordInput 
          mt='lg'
          ta='left'
          label='Confirm Password' 
          key={form.key('confirmPassword')}
          {...form.getInputProps('confirmPassword')}
          styles={{
            label: { color: 'var(--mantine-color-dimmed)' }
          }}
        />
        {
          errorStatus 
          ?
          <Group mt='10' mb='-20' c='red' justify='center' gap='0.25rem'>
            <IconX /> {errorStatus}
          </Group>
          : undefined
        }
        <Button type='submit' w='100%' mt='30' size='md'>
          Create Account
        </Button>
      </form>
      <Text fz='sm' c='dimmed'>
        Already have an account?
        <Anchor component='button' onClick={onLogin} fz='sm' ml='4'>
          Login
        </Anchor>
      </Text>
    </Stack>
  )
}
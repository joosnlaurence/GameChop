import { Stack, Title, Text, TextInput, PasswordInput, Button, Anchor, Group } from "@mantine/core";
import { useForm, isNotEmpty } from '@mantine/form'
import { IconX } from "@tabler/icons-react";
import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";

interface LoginForm {
  username: string;
  password: string;
}

interface LoginResponse {
  id: number;
  message: string;
}

export default function Login(
  {onSignUp, onSuccess}
  : 
  {onSignUp: () => void, onSuccess: () => void}
) {
  const [errorStatus, setErrorStatus] = useState('');
  const { login } = useAuth();

  const form = useForm<LoginForm>({
    mode: 'uncontrolled',
    initialValues: {
      username: '',
      password: ''
    },
    validate: {
      username: isNotEmpty('Username is required'),
      password: isNotEmpty('Password is required')
    }
  });

  const handleSubmit = async (values: LoginForm) => {
    const res = await fetch('http://localhost:3000/auth/login', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      credentials: 'include',
      body: JSON.stringify({ username: values.username, password: values.password })
    })

    const data = await res.json() as LoginResponse;

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
        Welcome back
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
        {
          errorStatus 
          ?
          <Group mt='10' mb='-20' c='red' justify='center' gap='0.25rem'>
            <IconX /> {errorStatus}
          </Group>
          : undefined
        }
        <Button type='submit' w='100%' mt='30' size='md'>
          Log in
        </Button>
      </form>
      <Text fz='sm' c='dimmed'>
        Don't have an account?
        <Anchor component='button' onClick={onSignUp} fz='sm' ml='4'>
          Sign up
        </Anchor>
      </Text>
    </Stack>
  )
}
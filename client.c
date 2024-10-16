/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ltomasze <ltomasze@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/16 14:18:33 by ltomasze          #+#    #+#             */
/*   Updated: 2024/10/16 15:07:26 by ltomasze         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <signal.h>
#include <stdlib.h>
#include <unistd.h>
#include "ft_printf/ft_printf.h" // Upewnij się, że masz odpowiednią ścieżkę do ft_printf.h
#include "libft/libft.h"

void	send_signal(int pid, char *message)
{
	while (*message) // Pętla dla każdego znaku w wiadomości
	{
		int bit_index;
		
		bit_index = 0; // Indeks bitu, zaczynamy od 0

		// Wysyłamy każdy bit znaku
		while (bit_index < 8) // 8 bitów w znaku
		{
			if ((*message >> (7 - bit_index)) & 1)
				kill(pid, SIGUSR1); // Wysyłanie sygnału SIGUSR1
			else
				kill(pid, SIGUSR2); // Wysyłanie sygnału SIGUSR2

			usleep(100); // Krótkie opóźnienie
			bit_index++; // Przechodzimy do następnego bitu
		}
		message++; // Przechodzimy do następnego znaku
	}
}

int	main(int argc, char **argv)
{
	if (argc != 3)
	{
		ft_printf("Usage: %s <PID> <message>\n", argv[0]);
		return (1);
	}

	int pid = ft_atoi(argv[1]);
	char *message = argv[2]; // Przypisanie wiadomości z argumentów

	send_signal(pid, message); // Wysłanie wiadomości do serwera
	ft_printf("Message sent: %s\n", message); // Wyświetlenie komunikatu
	return (0);
}
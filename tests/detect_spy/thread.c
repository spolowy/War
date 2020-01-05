/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   thread.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jfortin <jfortin@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/06/14 01:25:46 by jfortin           #+#    #+#             */
/*   Updated: 2019/06/14 02:08:24 by jfortin          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <pthread.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

void	*myThreadFun(void *vargp)
{
	(void)vargp;
	exit(0);
	return NULL;
}

int	main(void)
{
	pthread_attr_t	attr;

	pthread_attr_init(&attr);
	pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);

	pthread_t	thread_id;

	pthread_create(&thread_id, &attr, myThreadFun, NULL);
	while (1)
	{
		sleep(1);
		printf("tutu\n");
	}

	return 0;
}
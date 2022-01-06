Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294D0C433F5
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Jan 2022 18:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E890AC36AE3; Thu,  6 Jan 2022 18:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C1BC36AED;
	Thu,  6 Jan 2022 18:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641494742;
	bh=9IBzsylqXWqzn6dVwWHETs8tC2M6iFqadgXJv2WEzEM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=kzAhGJv52kXxacnuSinVPI9uI9bTkq2CoZPd9ou0Y6RXmyIB29+ltZb6ezWsA1RZR
	 m+ZbQukutvheEGVGU7RrI91yQ6em9bAwbBEuSBHOHVhvlX0p/Y1QH0XStuzhnXrX6i
	 yQwzlNvGWZILeGixiM4uPpEgL4w2IIxTaEjlQK54pj/Zz39e7SGvw4SJK9CitcTezv
	 8d0dbWOLHfAuA4OWqDIJPFSXsbpwOnVbaB7kTQ/RY9rYRWu/wMePQjIoqpdvGYjx60
	 ej+Fqh4hkcFfLbtnuAuOpnAPWOgsrpwEwZKJTJARTEtlPvdYzzUbPvOlPBNicglWo6
	 OBz5IN8ei9ZQw==
Received: by mail-io1-f46.google.com with SMTP id y18so4237684iob.8;
        Thu, 06 Jan 2022 10:45:42 -0800 (PST)
X-Gm-Message-State: AOAM533Hr97sOlSxA25cZfDKQfIRY7pV8TSGySYKJCjcaQrkpYrio9CP
	oUS11zNVYJZDPGrspuhOcPdwu+tJw1GIbdPHXTo=
X-Google-Smtp-Source: ABdhPJzgNc5ZRicfD1erwhGbufrWEyEzDIimtW5H2DXcVWTT494oIhY9MPJ4ZoJemBQEa1sCS5Bv0OZUaVAWL36JLig=
X-Received: by 2002:a02:c6a5:: with SMTP id o5mr29639636jan.145.1641494742093;
 Thu, 06 Jan 2022 10:45:42 -0800 (PST)
MIME-Version: 1.0
References: <BL1PR12MB5157CC3F63E96C7A9171ABC3E24C9@BL1PR12MB5157.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5157CC3F63E96C7A9171ABC3E24C9@BL1PR12MB5157.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 6 Jan 2022 13:45:31 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6idg=AQrCsHNNyhyjYoLhNXn=bhS680=ahDrWW0CFC3A@mail.gmail.com>
Message-ID: <CA+5PVA6idg=AQrCsHNNyhyjYoLhNXn=bhS680=ahDrWW0CFC3A@mail.gmail.com>
Subject: Re: amdgpu firmware update for yellow carp
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"Gong, Richard" <Richard.Gong@amd.com>, Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

In the future, can you please CC linux-firmware?  That way we have a
public record and the patches aren't lost if my mail setup dies or
something :)

josh

On Thu, Jan 6, 2022 at 9:59 AM Limonciello, Mario
<Mario.Limonciello@amd.com> wrote:
>
> [Public]
>
>
> Hi,
>
>
>
> Updated amdgpu firmware for yellow carp.  Can you please add to Linux-firmware.git?
>
>
>
> Thanks,

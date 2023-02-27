Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851DFC64ED6
	for <linux-firmware@archiver.kernel.org>; Mon, 27 Feb 2023 13:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50945C433EF; Mon, 27 Feb 2023 13:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B15CC4339B
	for <linux-firmware@kernel.org>; Mon, 27 Feb 2023 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677505311;
	bh=2DEa7ZTBTlDUFvjtKq3guT6aIdN5iZ43I/IBpzyPKnI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=CVIKOfkM8pLj9nWemkEx5L9ywGkl0S7FphcSZ0yHrp/QqTxep9DrfZXmBhayv4jNY
	 07cFoWfRLBNsdX3yKrAcYiXTndcq/MqUdz+7rYciFHzPXNQmTUDWdwW/H2a7MiMRdx
	 tGhmyMRBhdhbjJUkslmu3ZTVMx3zSbCxbrfM6EH2FG91dBFmUQyaj9m8W8H88ztVqU
	 OD4CNFbUXxBxoT+zDDrtI3OB9HZQ/DXKG4myhpyf0r/1kcPPoFab4Cave7giov3DBo
	 tdsP8X95FokOGoaRrtquLZ9NN94KT2H7Ftt1F2V8SGlkBbuBfywgbtSDUNjvI9cwq5
	 hZR41NmDZ6oyQ==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-536c02c9dfbso175489887b3.11
        for <linux-firmware@kernel.org>; Mon, 27 Feb 2023 05:41:51 -0800 (PST)
X-Gm-Message-State: AO0yUKWYuK0xigVmHCDLW4cSaSinVDApmB61YGUti+MT7sqo1ztx+whO
	KZ1o0fnFlZ6Ijbut+xmxqzbJLc20MZ0ml/N72XA=
X-Google-Smtp-Source: AK7set8LYFw+/RdRhedSUY6mXnAySe6mlHA7pRP4RwwBzQu2j3a47kZ16u9FEFuiZ1T+6D4z5JKfvwRPQSjifeQ3BzA=
X-Received: by 2002:a5b:84b:0:b0:a09:32fb:be73 with SMTP id
 v11-20020a5b084b000000b00a0932fbbe73mr9065755ybq.0.1677505310259; Mon, 27 Feb
 2023 05:41:50 -0800 (PST)
MIME-Version: 1.0
References: <GV1PR10MB62418A226A00A3D1BAE48A8FA3AB9@GV1PR10MB6241.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <GV1PR10MB62418A226A00A3D1BAE48A8FA3AB9@GV1PR10MB6241.EURPRD10.PROD.OUTLOOK.COM>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 27 Feb 2023 08:41:39 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7tFo3DNyWOYDKcsgzXrTv2vWv6x2-ZhpmNmqAUdqyW3g@mail.gmail.com>
Message-ID: <CA+5PVA7tFo3DNyWOYDKcsgzXrTv2vWv6x2-ZhpmNmqAUdqyW3g@mail.gmail.com>
Subject: Re: Can you add broadcom b43 firmware in linux-firmware.git?
To: =?UTF-8?B?SWxhcmkgSsOkw6Rza2Vsw6RpbmVu?= <ijaaskelainen@outlook.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2023 at 2:38 AM Ilari J=C3=A4=C3=A4skel=C3=A4inen
<ijaaskelainen@outlook.com> wrote:
>
> Can you add broadcom b43 firmware in linux-firmware.git?

No.  We require the owners of the firmware to submit their firmware to
the linux-firmware git repository under a license that permits free
redistribution, so that would be up to Broadcom.

josh

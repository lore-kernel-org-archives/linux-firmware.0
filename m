Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5551DC77B7F
	for <linux-firmware@archiver.kernel.org>; Wed,  3 May 2023 13:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3EB8EC4339C; Wed,  3 May 2023 13:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2864DC433EF
	for <linux-firmware@kernel.org>; Wed,  3 May 2023 13:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683119496;
	bh=CKuregndybYrHA4YS/U0rhh/8eTZJNGbM0TUIOQvI20=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=YcmD8ztcXxlDE/ntxSA0yaoQOwpY6g6P2TsDKfc7yHnq9eu32Gkm9eQ9Cp6EFKi89
	 D5Eb5OGw4UAKW2sdbIKkQyaKX1Vil4VYaEa9pzt5IYzXp2DJy6Xs8pQlyRa++IldKy
	 1bBQ+TakiMUwxUUSIRiVmO6QoGtrTiJ3dzQHpGgEzrI8mLaShTAmIA4L4AIpby1+Ki
	 oqFKUvWWtt10hvTJ9R345iz8P64Tp2mJGa6bzN9vJsETNlrfpJa9UzPZ9bo7cAM0UU
	 eSK/EPszLbCJtfVFYKWKvJPhJKtrDs/4qes6zafd+4T2csEMUqvPWvmIeFYnI8hQXm
	 Jb0uEEHjrNb+A==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-b9d87dffadfso4277605276.3
        for <linux-firmware@kernel.org>; Wed, 03 May 2023 06:11:36 -0700 (PDT)
X-Gm-Message-State: AC+VfDzoZ6l5CmcfZxQ+3nPcMv9yuioJvFzurhJBJdR12G7KRigMmxfD
	CaNfYlne96TbkMqmEH0/UYgr4GUveSx4Hn0fD+I=
X-Google-Smtp-Source: ACHHUZ6lRfxi0Wmbw/M5b9nq6ttrerbDQBlclQDILPYJIOHRzVjjkVUP4ODO0JNxFN5t2I/zqeTA5UdjBN8fADlSF78=
X-Received: by 2002:a25:d601:0:b0:b8b:dd05:b60 with SMTP id
 n1-20020a25d601000000b00b8bdd050b60mr21120952ybg.45.1683119495225; Wed, 03
 May 2023 06:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_MW_xEBWQ7r1CVYvOiLgtrKWGyH9ipBupHgmkKW+GUh3g@mail.gmail.com>
In-Reply-To: <CADnq5_MW_xEBWQ7r1CVYvOiLgtrKWGyH9ipBupHgmkKW+GUh3g@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 3 May 2023 09:11:24 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6BCkpzFxv=KZjCrmVy0oYSbmPH9UFNQ329gTXyv649fw@mail.gmail.com>
Message-ID: <CA+5PVA6BCkpzFxv=KZjCrmVy0oYSbmPH9UFNQ329gTXyv649fw@mail.gmail.com>
Subject: Re: Updated amdgpu DMCUB firmware
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, 
	Chandan Vurdigere Nataraj <chandan.vurdigerenataraj@amd.com>, Deepak.Sharma@amd.com, 
	Aurabindo Pillai <aurabindo.pillai@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 2, 2023 at 5:25=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com>=
 wrote:
>
> Hi,
>
> Updated DMCUB firmware for DCN 3.1.6 display IPs.  Please apply!

Applied and pushed out.

josh

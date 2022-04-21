Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21151C433F5
	for <linux-firmware@archiver.kernel.org>; Thu, 21 Apr 2022 10:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5E89C385A7; Thu, 21 Apr 2022 10:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0BEDC385AA
	for <linux-firmware@kernel.org>; Thu, 21 Apr 2022 10:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650537838;
	bh=plovtLjxOOxEkxMqPhxwnSO7lzh2U9n691zvJM4k2lw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=T4zAY2kNCNnz2PsXL6VOMU/PDtZ61cIPckH1LRC3GoMclhSf/D7OLyYx/t1NEdCJT
	 uA9BIHbNjMi+D9qgmmFGDM5YEoWuo7PYyQ5uO8bkvKDkHK4vrAr4sVSnvpIePbJPmt
	 YKxuuhV7eOapYO/MWnu++mfq7Z78d0QEXHZCkdtrPL528kAHULouUNWN8k0oHQ9NRy
	 xZx+UAn/KWKUp5y2k+rDJVqBvLS5oNNqXQVUwZ9UF2F7Gd7Y+gyA5CXCRXebuFBf3j
	 eKZK3t9hDylHjRFImq20mz1QrXHa5chgtq02GgMsITL3oWOUpdAeP36O4F01HY7/4z
	 X9PK4t9z0REAQ==
Received: by mail-io1-f41.google.com with SMTP id 125so4814042iov.10
        for <linux-firmware@kernel.org>; Thu, 21 Apr 2022 03:43:58 -0700 (PDT)
X-Gm-Message-State: AOAM53296hhbAIGZFFiKsfipoVrmoE7iL8KwgwAEcYdkK0XVi6aND678
	vC97xjDYpWH3Q1n+2AJZZsM7UiqDk4dy1abDiu4=
X-Google-Smtp-Source: ABdhPJymaIHTkJ7g9jt9v03ICDMuDRAwMPnxd/1WOHpqKli2srW5Z560q4Ca4+xSuD/4p28YsDgAff7QkEp4XqSOoLc=
X-Received: by 2002:a6b:fa13:0:b0:64f:d480:30d3 with SMTP id
 p19-20020a6bfa13000000b0064fd48030d3mr11060379ioh.179.1650537837878; Thu, 21
 Apr 2022 03:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_NnRNNVXXMN3=keE1W+DYP01Nv_A_Rr44p4YBObTXqqjA@mail.gmail.com>
In-Reply-To: <CADnq5_NnRNNVXXMN3=keE1W+DYP01Nv_A_Rr44p4YBObTXqqjA@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 21 Apr 2022 06:43:47 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7D6suT1EhByhRXf_8kHWDdTDCwvf-Jey7Cu+3yrg3p=g@mail.gmail.com>
Message-ID: <CA+5PVA7D6suT1EhByhRXf_8kHWDdTDCwvf-Jey7Cu+3yrg3p=g@mail.gmail.com>
Subject: Re: amdgpu firmware update
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, "Gong, Richard" <richard.gong@amd.com>, 
	"Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Wed, Apr 20, 2022 at 2:37 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi,
>
> Updated DMCUB firmware for yellow carp.  Please apply!
>
> Thanks,
>
> Alex

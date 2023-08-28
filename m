Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739F9C83F12
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Aug 2023 11:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42A2FC433CC; Mon, 28 Aug 2023 11:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B46BC433C9;
	Mon, 28 Aug 2023 11:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693221165;
	bh=tZOxDYEn6ooD68jYpJgPagL+xSsXAXPaxqEVidNi328=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=TKDhKzW/uzcySxyhCkpb9G5yN8dtrod86qNKDhXZaHql00aO24PKSD5l2DF6QHHrt
	 zDIN3hK5Dws9HRB9eZbUIbC42lu6eNMDVKFxpXYWrLMvBJfjSYlmUiyP3sbuCAkkqF
	 HZi7w4IW2Uok7a4jviE80itCbUDIAxhkNIupT2x2fAPaRw0fgihPAE5eCyWDR4iKNp
	 AKR+Iam7/qv8EFHc3DEk25OZ7AsC3G7nPtafekQZvkLCWaL7ulaG8zhY0CClz0SAOW
	 V7bNlnpok+cKtLo5pW5hQ1PkWyrqPGDWc8lEOo8gBaFyRziet/F+Il5f/fFvqVURZ2
	 aEIVqunOh1z6Q==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-58fba83feb0so34832547b3.3;
        Mon, 28 Aug 2023 04:12:45 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx8fxn/tHLzF3SRMB5hjSu6aBOpguEOcaPuO+ULNX8PLAab+e7L
	Bhq90EcJEHoXKQ0QL4OhPjsfHmBCQwZPEAIVk10=
X-Google-Smtp-Source: AGHT+IFGo0NG/wpoq5gkNtWaE6oSw8s/3u1SgxHtLyG99X2EfqQH+booCINNyF2/o8ZMZeNRX/OCf7/f/g1adjRh/7E=
X-Received: by 2002:a81:a254:0:b0:592:5cbd:e171 with SMTP id
 z20-20020a81a254000000b005925cbde171mr14724176ywg.43.1693221164176; Mon, 28
 Aug 2023 04:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230825202041.194349-1-hamza.mahfooz@amd.com>
In-Reply-To: <20230825202041.194349-1-hamza.mahfooz@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 28 Aug 2023 07:12:33 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6vBbGK4DznO45gp3N3OEL8ERzyjUfe_fLGMCEZ2NjgYg@mail.gmail.com>
Message-ID: <CA+5PVA6vBbGK4DznO45gp3N3OEL8ERzyjUfe_fLGMCEZ2NjgYg@mail.gmail.com>
Subject: Re: Update of amdgpu DMCUB firmware (2023-08-25)
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne.Lin@amd.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: jwboyer@kernel.org, linux-firmware@kernel.org, alexander.deucher@amd.com, 
	mario.limonciello@amd.com, chandan.vurdigerenataraj@amd.com, 
	deepak.sharma@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 4:20=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.co=
m> wrote:
>
> The following changes since commit a33f8f1abd1df344798188807de4b4397d7484=
d3:
>
>   amdgpu: update DMCUB to 0.0.181.0 for various AMDGPU ASICs (2023-08-25 =
15:25:00 -0400)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-08-25

Does this replace Wayne Lin's pull request for tags/amd-2023-08-18?

I can't get to gitlab.freedesktop.org at all right now, so I can't pull eit=
her.

josh

>
> for you to fetch changes up to a33f8f1abd1df344798188807de4b4397d7484d3:
>
>   amdgpu: update DMCUB to 0.0.181.0 for various AMDGPU ASICs (2023-08-25 =
15:25:00 -0400)
>
> ----------------------------------------------------------------

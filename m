Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0932AC3DA64
	for <linux-firmware@archiver.kernel.org>; Thu,  1 Aug 2024 21:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5571C4AF0A; Thu,  1 Aug 2024 21:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA882C4AF09
	for <linux-firmware@kernel.org>; Thu,  1 Aug 2024 21:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722548075;
	bh=wEVAHgP2zWCBJPwFpcWvZ8+1HgqyQTEOKobTCZGciPY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FUIEOoBz5k84UcnkSxTr9p57VCBVypkkNdOY8rnIXaJ8tHs1RBvAtvSZI1t73QxCE
	 1IUZxYpotzfpKvo+WBKPjULYOF7KGToitK78ApjueROH89/5BfftSRNAv/9AwJI3pS
	 GHcnGtIM+oOXT947FGoo6g+YHQZTVCnKBwW5UwCgn8FDe7rw4C32AQnmdjsPLW6994
	 JMek479wttpHrwIUsREC8vOPELj0nmcigzGbq1vgSpTc443HGGjYL+Z2Nx+bUBngyr
	 709f55FtUp2NZm+iingVdv1Ixm5jiuykCKotcUxYF6MruczHXuZ6Cd4mD84m5crjG7
	 Cnm5WAFrzoBIQ==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-66108213e88so61101017b3.1
        for <linux-firmware@kernel.org>; Thu, 01 Aug 2024 14:34:34 -0700 (PDT)
X-Gm-Message-State: AOJu0YxBUKEejXvA5QtxHQcDfs+EzBaF6Lm4uHvjQ5FepNnylr436lgc
	ZyYv1EKjMhq3sIQ6L99mekks8xtguOy93MeJLmnqW0NYCof+VzpbF7LpLpE1dGm6WbL0YFTCREh
	FSefakE+txQpmcSgwW50jrOMZoDM=
X-Google-Smtp-Source: AGHT+IEe8QohggwT7k17kSA0t4qLAsTO/JtkZoC3JrJ11GiDpKDcDhnQE2+GJHQvrxMbcR649BO9SZ2d0tEEezzLdek=
X-Received: by 2002:a0d:fd42:0:b0:64a:e7ec:f3d with SMTP id
 00721157ae682-689601af310mr14297287b3.18.1722548073876; Thu, 01 Aug 2024
 14:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240729153029.152836-1-pratap.nirujogi@amd.com>
In-Reply-To: <20240729153029.152836-1-pratap.nirujogi@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 1 Aug 2024 17:34:22 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4Nuvxv7c8dQvNnR2U1j_CjUfzKN45khURa7NVd4Drn5w@mail.gmail.com>
Message-ID: <CA+5PVA4Nuvxv7c8dQvNnR2U1j_CjUfzKN45khURa7NVd4Drn5w@mail.gmail.com>
Subject: Re: pull request v1: amdgpu: Update ISP FW for isp v4.1.1
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>, 
	Benjamin Chan <benjamin.chan@amd.com>, King Li <king.li@amd.com>, 
	Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 11:30=E2=80=AFAM Pratap Nirujogi
<pratap.nirujogi@amd.com> wrote:
>
>   amdgpu: Update ISP FW for isp v4.1.1 (2024-07-29 11:15:54 -0400)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git amd-isp-staging

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/263


josh

>
> for you to fetch changes up to 2416810743f9ab114a838b6245f32689c3a327b9:
>
>   amdgpu: Update ISP FW for isp v4.1.1 (2024-07-29 11:15:54 -0400)
>
> ----------------------------------------------------------------

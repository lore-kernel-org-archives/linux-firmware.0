Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EEAC61D99
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Nov 2023 00:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6ED80C433C7; Thu, 23 Nov 2023 00:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53892C433C9
	for <linux-firmware@kernel.org>; Thu, 23 Nov 2023 00:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700697784;
	bh=rHy3BSpAMF6HVF10G0x0LbbFwiABILOpFiblkeFXeWQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=g3T0NBKWL7kUIx3gkq8Ulo0Jt0Z/zfY8JgHRGuIXMgTXUKYbI6kYIcl0wVFoHHRaz
	 aebwtTMNVN/CSJXPX8MvWKUN9DGwq9+hbOwCbQsXt4x8QAZWpcKwbdblw8Hrg7S3gL
	 awtF4xX3+J99jA0adz48yVPn57SyjFvYMHp7WNTNi3tS9HWnp88SNdfde8NbQmlW+r
	 iSxCGZ/3KNnd/EyQ50fTKSiBXD4o7s/JxN9oRTad+MrHFlb/yg+ZAtiGXST9yybRFa
	 /6dUr+Zt1FmOS1yG9uhaowxrmd1IKiISW8LaayaRRXoqYotFLvoW7AcdVMjj31BExD
	 0cTg2Sc86LDvA==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-da37522a363so372512276.0
        for <linux-firmware@kernel.org>; Wed, 22 Nov 2023 16:03:04 -0800 (PST)
X-Gm-Message-State: AOJu0YzLPUR8AI7GtxV5yF1rejiJOUqfOJbuzt+iiiQ3077bsgIRc/8O
	y4Uv2V53lIoF0OX97IXjO58byBOT+MI9N2z14RQ=
X-Google-Smtp-Source: AGHT+IGvWwN8qw4BjccpZyI+feGW3kQSevTE9GJdFtJ29eEfhFs0tzpCHudd41BIMn/Zl9TUW7O9dOKHDdgsPprPu5k=
X-Received: by 2002:a0d:df0d:0:b0:5c9:e7f8:ba03 with SMTP id
 i13-20020a0ddf0d000000b005c9e7f8ba03mr3756122ywe.4.1700697783448; Wed, 22 Nov
 2023 16:03:03 -0800 (PST)
MIME-Version: 1.0
References: <20231117215221.23371-1-hamza.mahfooz@amd.com>
In-Reply-To: <20231117215221.23371-1-hamza.mahfooz@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 22 Nov 2023 19:02:52 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6s2hJ6PduAB8+VQda+pd68hacNH9qKv_uBMG81a_X=XA@mail.gmail.com>
Message-ID: <CA+5PVA6s2hJ6PduAB8+VQda+pd68hacNH9qKv_uBMG81a_X=XA@mail.gmail.com>
Subject: Re: pull request: amdgpu: update DMCUB firmware to v0.0.193.0
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 4:52=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.co=
m> wrote:
>
> The following changes since commit c03db704fa78ad3c44b18ccf51d0af6373b1f5=
8f:
>
>   amdgpu: update DMCUB firmware to 0.0.193.0 for DCN31 and DCN314 (2023-1=
1-17 16:38:32 -0500)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-11-17
>
> for you to fetch changes up to c03db704fa78ad3c44b18ccf51d0af6373b1f58f:
>
>   amdgpu: update DMCUB firmware to 0.0.193.0 for DCN31 and DCN314 (2023-1=
1-17 16:38:32 -0500)

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/70

josh

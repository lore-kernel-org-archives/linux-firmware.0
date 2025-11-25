Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A59D0EE13
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Nov 2025 18:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 493F2C16AAE; Tue, 25 Nov 2025 18:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E29C19421
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 18:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764095518;
	bh=sPQchN0r16i1L4lhX2jSouin7JeSAY5T/s0p9Y3GEYw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=mQWVBAnzxsKKWFT/MnkskmHGYEmHYr/pZOQdCU3FpM/1/W26pY1v7eWdz2AJFGPgK
	 3YPQuFlYDTc8gY33iyBPI8QVxpV+/X0M0n/j66uyXW714IcQqD24pYgcKzwsBWnchX
	 C2loAeMoj8zORu85ZcOB2+6kKtAQQajqDTgFpJTdLKLqEHyFRWUkHIp0ZsMN9y2OIu
	 LcBliNdJewqaoahDBX/J/mQycm6WfFc8FtZ6Sq6LfeUNrRtvTXlIjW5SY5fPbgcd34
	 F4aCdoXgQBZaJwtyNC4FnRtL5sogENj68TYvlZzT0MsAyKDEVbqEAQowsFFbbbT05F
	 6q6qmNR+RiCKQ==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-789524e6719so2018037b3.1
        for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 10:31:58 -0800 (PST)
X-Gm-Message-State: AOJu0YyUrj+Hf5NfrNBhoyEHAlqTw2V6s7wJyNJgXQhUw3qUDzw53S8Z
	bvcg/XCAOmzpKmIBYPE2000G5XJWTN+DSwzKoJtOHSxbSTBRGGN7B7lak6BEGcN6xYVK+83UZrA
	79njCvqcNOZ0am552FNdYF15drl0AT+M=
X-Google-Smtp-Source: AGHT+IH8uG/H+5IrqPhMNcPwGfSe7N+ZZHrOmt0ASmd7lSXjO5B6oqHzMp6Z7LFr3NQQbnhVlmiRQ147ux/ZQIlGsgs=
X-Received: by 2002:a05:690c:f04:b0:787:bdc6:ede3 with SMTP id
 00721157ae682-78a7ba12991mr157652947b3.8.1764095517438; Tue, 25 Nov 2025
 10:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20251125163311.2087275-1-alexander.deucher@amd.com>
In-Reply-To: <20251125163311.2087275-1-alexander.deucher@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 25 Nov 2025 13:31:46 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5d4Auv3oa93ORk8g=-8h1kmDn6CyhKbC73hb1Mtp-fug@mail.gmail.com>
X-Gm-Features: AWmQ_bk63U081KVcQDqH7AlxcLjTIa34QdeyTY2eVpOyJ4RdvOeIRxeYaQpCc6U
Message-ID: <CA+5PVA5d4Auv3oa93ORk8g=-8h1kmDn6CyhKbC73hb1Mtp-fug@mail.gmail.com>
Subject: Re: [pull] amdgpu firmware update
To: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Mario.Limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/803

josh

On Tue, Nov 25, 2025 at 11:33=E2=80=AFAM Alex Deucher <alexander.deucher@am=
d.com> wrote:
>
> Hi,
>
> Revert GC 11.0.1 firmware update as it has been reported to cause
> GPU page faults with OpenCL applications.
>
> The following changes since commit a193f375146b41b294c07b5e15bc17c27a7320=
a9:
>
>   amdgpu: DMCUB updates for various ASICs (2025-11-21 20:15:21 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-staging-20=
25-11-25
>
> for you to fetch changes up to db29fc93958da80c76f45cde179ca1138afd17ff:
>
>   Revert "amdgpu: update GC 11.0.1 firmware" (2025-11-25 11:23:15 -0500)
>
> ----------------------------------------------------------------
> amd-staging-2025-11-25:
>
> revert GC 11.0.1 firmware update.
>
> ----------------------------------------------------------------
> Alex Deucher (1):
>       Revert "amdgpu: update GC 11.0.1 firmware"
>
>  amdgpu/gc_11_0_1_me.bin    | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_0_1_mec.bin   | Bin 268160 -> 268160 bytes
>  amdgpu/gc_11_0_1_mes1.bin  | Bin 232784 -> 232816 bytes
>  amdgpu/gc_11_0_1_mes_2.bin | Bin 257376 -> 257312 bytes
>  amdgpu/gc_11_0_1_pfp.bin   | Bin 263424 -> 263424 bytes
>  amdgpu/gc_11_0_1_rlc.bin   | Bin 157040 -> 157040 bytes
>  6 files changed, 0 insertions(+), 0 deletions(-)

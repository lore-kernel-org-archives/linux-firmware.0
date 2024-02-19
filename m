Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22650C48BF8
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Feb 2024 12:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0CE39C433C7; Mon, 19 Feb 2024 12:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC54C433F1
	for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 12:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708347124;
	bh=J87Tu6u2oT2H62KsZ/68VXLsbYfYlPpW8UpwxoYYmT0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=UaNhpDW0T0SyLhSkH0b0WBd5m7XQHX/Dced68qAhLIAjTLhOD7oZkgEouhoF5vQH5
	 l377DBZvlJHwaSNVNNy12wM8wSESwIWNkXOcO1hll0MJWmTlnucaaoryoQUY9f5UPX
	 t1uIVcwIN/tAQPpFIgWhVBYLMjgnmb3xTz2Opuy4fXP9xProJcCgK7kxDio8C9RBCD
	 5QCPRDxNYjg493dgqtQOfPW8VyaQBc9FyrA/oMCLdBgt+n62BrQSDy4MdzculqSwac
	 jVoN9DjkWu8TwN93r2xIMVjaxriQGAw5WWztdXfMxKtBwcwmCb6NXDscdc+kmgaxxf
	 TYUCgRUQJAgKw==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6080beb19ddso18778577b3.1
        for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 04:52:03 -0800 (PST)
X-Gm-Message-State: AOJu0YxdrLNkjp7Q7B1I62baUPWbdHUepdV48Dz6YZxC921LJM/xnwkq
	81K09/51JyI+/mCa2DznIMKTkCwUAboVF8+yS4Uc/2/ITFJVFy4yzs76g9sBS97PLT76Na+O8vo
	CemJxUEAz9bq5Rz23szIscwYtwVE=
X-Google-Smtp-Source: AGHT+IFpzcr7Qll5o6WZfF8q4iC/5AjZURR7ke0LVebxgWvfdjWqQpxMM49cV/az1bQKECcKQ08inthj2Hnb7AAP/BU=
X-Received: by 2002:a0d:cb89:0:b0:607:c93f:2c2a with SMTP id
 n131-20020a0dcb89000000b00607c93f2c2amr12005271ywd.46.1708347123064; Mon, 19
 Feb 2024 04:52:03 -0800 (PST)
MIME-Version: 1.0
References: <6688576e-64dd-4638-b8e3-4ef09c84d8de@opensource.cirrus.com>
In-Reply-To: <6688576e-64dd-4638-b8e3-4ef09c84d8de@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Feb 2024 07:51:52 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6BfjW9_Ej++Ba0UjEtWNSyvUpL7SQj78h7EeLknApFPQ@mail.gmail.com>
Message-ID: <CA+5PVA6BfjW9_Ej++Ba0UjEtWNSyvUpL7SQj78h7EeLknApFPQ@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Correct issues to CS35L41 firmware and
 tuning for HP laptops
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 10:22=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to make some corrections to some issues with CS35L41
> firmware for HP laptops.
> Patch 1 corrects symlinks for a couple of HP laptops.
> Patch 2 removes firmware and tuning for a couple of laptops which are
> not longer required.
>
> Thanks,
>
> Stefan
>
> The following changes since commit 3677750467cb8286c59462e490df23d8462a84=
f9:
>
>    Merge branch 'robot/patch-0-1706798549' into 'main' (2024-02-01
> 20:46:31 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware/ hp_fw_fix

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/147

josh

>
> for you to fetch changes up to 1cf931df1c390227c02594b61edebca6cf77a2f4:
>
>    linux-firmware: Remove 2 HP laptops using CS35L41 Audio Firmware
> (2024-02-02 15:17:12 +0000)
>
> ----------------------------------------------------------------
> Stefan Binding (2):
>        linux-firmware: Fix filenames for some CS35L41 firmwares for HP
>        linux-firmware: Remove 2 HP laptops using CS35L41 Audio Firmware
>
>   WHENCE                                       |  28
> ++++------------------------
>   cirrus/cs35l41-dsp1-spk-cali-103c8d01-l0.bin | Bin 1888 -> 0 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8d01-l1.bin | Bin 1888 -> 0 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8d01-l0.bin | Bin 4052 -> 0 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8d01-l1.bin | Bin 4052 -> 0 bytes
>   5 files changed, 4 insertions(+), 24 deletions(-)
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8d01-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8d01-l1.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8d01-l0.bin
>   delete mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8d01-l1.bin
>

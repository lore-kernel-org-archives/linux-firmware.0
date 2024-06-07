Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25CAC27C5F
	for <linux-firmware@archiver.kernel.org>; Fri,  7 Jun 2024 16:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70567C4AF07; Fri,  7 Jun 2024 16:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7B5C32786
	for <linux-firmware@kernel.org>; Fri,  7 Jun 2024 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717776013;
	bh=varpwMPQGGP1lxCe6sUKH51O+B2PViLA9RW4AjMa134=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=mWu4tbGOHCcZoNVx+5ctizMKKqb2Wj9xiVCOaQZd9N5mhdY3KYgd8jx497lO+qflb
	 YKtSdhcl0/hJzEf5lgxTkKDPtEiVPKSgFG8Of+XgQCH9PQjC4uE/8GofCMAkkhVkvt
	 MEpEsEUjgFUvrQhe/zw/pUFsSJlxKy8Mrz0Oe0ZXGKUCJ2m8tt63c6BlHgGP+/He8+
	 d5w8TjxB3SIHrlmuxU85JUm7srh8dlKAY3+m94eEYaZDupaJwNZr1bPfOR9CdCdRFN
	 xpKBOOyDMSXbgPk0LaRJtOcObfljPHlMbfkschwgI48XYPfleLXBoRv/SZ17/bX1D1
	 Tlc2q8fTOh8EA==
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dfa4876a5bbso2240329276.2
        for <linux-firmware@kernel.org>; Fri, 07 Jun 2024 09:00:13 -0700 (PDT)
X-Gm-Message-State: AOJu0YytV0+e0risUI6yPKWQrr2Agz05R2VEILSJXtizjbLd0FBvyrow
	NkT5EZjP7nr6AbPSecp1B6oS8M3M8LW+lfu06z/V/EKkLHpB9dqbQHq6W2X5e0Y4u/m8/z+eNWd
	LNl8YYGThvSNs8dwlTqk0KpPSa80=
X-Google-Smtp-Source: AGHT+IGCMDm7Ub41gr44MiqU6xGBzBn+a308+ngyAg7frvM5Dd8uwcuC1i5t5MeG1dQMKmej51MJ/cr4RvxGqwE5j8E=
X-Received: by 2002:a25:810a:0:b0:dfa:ce78:e5c6 with SMTP id
 3f1490d57ef6-dfaf65378cfmr2642420276.35.1717776012418; Fri, 07 Jun 2024
 09:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <643c03aa-12dd-4e02-9086-e139d7671adf@opensource.cirrus.com>
In-Reply-To: <643c03aa-12dd-4e02-9086-e139d7671adf@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 7 Jun 2024 12:00:01 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6OXq3-GM8vjZq8hUDc_cv_c8+y_UYN7mAke5cvLATgVw@mail.gmail.com>
Message-ID: <CA+5PVA6OXq3-GM8vjZq8hUDc_cv_c8+y_UYN7mAke5cvLATgVw@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for Lenovo Thinkbooks
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 9:48=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
> CS35L41 for Lenovo Thinkbook 13X Gen 4 and Lenovo Thinkbook 16P Gen 5.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit 22643bb4fb5e2693fa67cfca1f133d650bcf16=
be:
>
>    Merge branch 'amd-staging' into 'main' (2024-06-04 18:18:52 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware/ 2024-06-06

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/222

josh

>
> for you to fetch changes up to 7f194335c1872ab7c68c17cac41e7070d0e8ae41:
>
>    linux-firmware: Add firmware for Lenovo Thinkbooks (2024-06-06
> 14:18:56 +0100)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>        linux-firmware: Add firmware for Lenovo Thinkbooks
>
>   WHENCE                                              |  16 +++++++++++++=
+++
>   cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l0.bin | Bin 0 -> 5396 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l1.bin | Bin 0 -> 4280 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r0.bin | Bin 0 -> 5396 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r1.bin | Bin 0 -> 4280 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l0.bin | Bin 0 -> 5396 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l1.bin | Bin 0 -> 4360 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r0.bin | Bin 0 -> 5396 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r1.bin | Bin 0 -> 4360 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-l0.bin | Bin 0 -> 5496 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-r0.bin | Bin 0 -> 5496 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-l0.bin | Bin 0 -> 5544 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-r0.bin | Bin 0 -> 5544 byt=
es
>   13 files changed, 16 insertions(+)
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-l1.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38c7-spkid0-r1.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-l1.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38c8-spkid1-r1.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38f9-spkid1-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38fa-spkid0-r0.bin
>

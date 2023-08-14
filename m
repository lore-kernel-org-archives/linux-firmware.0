Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2AEC001B0
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Aug 2023 17:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95579C433C7; Mon, 14 Aug 2023 17:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFD6C433C9
	for <linux-firmware@kernel.org>; Mon, 14 Aug 2023 17:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692032678;
	bh=cO8IxTcFzO5ZQjedXuQYXDWoEwq4Jboqw0vke1+0nSA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MfqZraScFeX2smchkrsc8720EMCT1CVGh/V+IvlWLHdCZ+YnfI2cqoayYcQ5mFib2
	 RSfh3oc/H2Cl5231FKe6/E+mcf3R8zprfaI9ORrQtkHPDwPNZgEyeR71hNzJX39wWi
	 Oi7bzq/SkxGv/owa69W9usnP0zV9+Et/Ci8fp0SLJJIRY2CXDP6QIed/s0kuELDWQw
	 JbvmEmVd9TWn3Amo4R3rkbjM/R1pk1J8ay2FW9T9Bxb3Lb6nTys1qcqur0bBoUXfzi
	 wba7a0Qd4tk6OcCmf9T1Y4AKTuKkhqMX/L7bxOWSCcsjGGsqATsOdiZ7tgGPZ7HC1t
	 Ahr2Ljomlio+w==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-589e590af61so22846517b3.0
        for <linux-firmware@kernel.org>; Mon, 14 Aug 2023 10:04:38 -0700 (PDT)
X-Gm-Message-State: AOJu0YyjI1E9RqkUPPdvvh3dGaHpmNOqoFuLXzXrvEbghNHLeoKLrUY1
	5TnrJ6EF5Z+4zpa5Q7g4PDPZr8DMuzMjr81K9S4=
X-Google-Smtp-Source: AGHT+IFXS97g0Uv8U1/AxK3ZgTWRvYNoVkS9fXJqdkUHTDw/k8An8nnbpJqyiTpN89YOMVLm4Yqd0W2qagsR9dcFBVA=
X-Received: by 2002:a25:9781:0:b0:d67:35c1:7ba6 with SMTP id
 i1-20020a259781000000b00d6735c17ba6mr11131306ybo.21.1692032677477; Mon, 14
 Aug 2023 10:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <ffe87e89-0128-5b3e-153f-642239de6796@opensource.cirrus.com>
In-Reply-To: <ffe87e89-0128-5b3e-153f-642239de6796@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 14 Aug 2023 13:04:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7kp8iXT98ghokWT=OQSzsj4oiWtEVi427DooW7P_NUUQ@mail.gmail.com>
Message-ID: <CA+5PVA7kp8iXT98ghokWT=OQSzsj4oiWtEVi427DooW7P_NUUQ@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for HP G11 Laptops
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 9, 2023 at 11:08=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
> CS35L41 for HP G11 Laptops.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit 253cc179d849fc82489773b2b553a49858d872=
5f:
>
>    amdgpu: Update DMCUB for DCN314 & Yellow Carp (2023-07-31 11:22:02 -04=
00)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware for-upstream

Pulled and pushed out.

josh

>
> for you to fetch changes up to 980373f5874787b7d98a204feabdccc971c42dc0:
>
>    cirrus: Add CS35L41 firmware for HP G11 models (2023-08-09 15:57:54
> +0100)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>        cirrus: Add CS35L41 firmware for HP G11 models
>
>   WHENCE                                                  |  29
> +++++++++++++++++++++++++++++
>   cirrus/cs35l41-dsp1-spk-cali-103c8c46.bin               | Bin 0 ->
> 1932 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c47.bin               | Bin 0 ->
> 1940 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c48.bin               | Bin 0 ->
> 1932 bytes
>   cirrus/cs35l41-dsp1-spk-cali-103c8c49.bin               | Bin 0 ->
> 1932 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c46.bin               | Bin 0 ->
> 4872 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c47.bin               | Bin 0 ->
> 4884 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c48.bin               | Bin 0 ->
> 4988 bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8c49.bin               | Bin 0 ->
> 4988 bytes
>   cirrus/cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.wmfw | Bin 0 ->
> 34200 bytes
>   10 files changed, 29 insertions(+)
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c46.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c47.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c48.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8c49.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c46.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c47.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c48.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8c49.bin
>   create mode 100755 cirrus/cs35l41/v6.83.0/halo_cspl_RAM_revB2_29.85.0.w=
mfw
>

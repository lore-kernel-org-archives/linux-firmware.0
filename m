Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FCAC5475B
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Mar 2024 13:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69643C433C7; Fri,  8 Mar 2024 13:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2E8C433F1
	for <linux-firmware@kernel.org>; Fri,  8 Mar 2024 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709904662;
	bh=J94d/lnSkWW5+ZTKW/GvhK1N4Ohpr71VWbsHai1Uwv0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=R0GXRFACYLHvpaaT9eAcSifOCiWnB8GOyY314zUPk9KsWUMMNvHXDaSiQpAoAQCkv
	 8DO+uIU0Swl+AxICMKNZdjquV/IKVULlyXRlnJDoRx5qmZ2tsQAvG/Pa6VnCwzcNDd
	 8q1ph7ey3MHAsZjkTVUa6S19tIn1jWF971mLqCW52Bf6UdcvnVHs/OLE+1Py1DG+tg
	 xYPehqaifiST8CG2biadeVuL7MAGyeFCP9Kn81m21ff+8JSJS8N4iqJ1KscLb7xw4U
	 Kvqczy4OMB7nifjAaGM/9kapMUz3VywCmtlHh02owA5MN+q+6hKdADr4DVsAA9h+B+
	 Qh8JRe3BWPJgA==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so2184025276.2
        for <linux-firmware@kernel.org>; Fri, 08 Mar 2024 05:31:02 -0800 (PST)
X-Gm-Message-State: AOJu0YxTgy5HQhK8iCAeIx59KC6NGN9lep8RQ5ecCsXcaIj14u4oNWBh
	XxdxfvNPIwFJOXH54QflqqE4C8WZf5EffbPHTmnFShCSIeqnWUEUlUhC2bcL/L9XeSR8jtLaqke
	XVxsEcGS0JfJWOqvfyWKkf7Jzp5Q=
X-Google-Smtp-Source: AGHT+IGgEiJ5v9BpDCyxOZ2qV4LMNWOa+u1AZiFnJeD/yP4lX5MVYv7sRTDvTyefXGzQnwDbpxLjIFu04l9u7oB29a0=
X-Received: by 2002:a25:824a:0:b0:dcc:dbb8:ba73 with SMTP id
 d10-20020a25824a000000b00dccdbb8ba73mr19490638ybn.9.1709904661391; Fri, 08
 Mar 2024 05:31:01 -0800 (PST)
MIME-Version: 1.0
References: <f4d7b131-b62f-4bbd-ab03-946fcba36f51@opensource.cirrus.com>
In-Reply-To: <f4d7b131-b62f-4bbd-ab03-946fcba36f51@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 8 Mar 2024 08:30:50 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5SHGS+b3d93iZMmCE8mGCTJMgqHaNwj9fyPSSWVc5pCw@mail.gmail.com>
Message-ID: <CA+5PVA5SHGS+b3d93iZMmCE8mGCTJMgqHaNwj9fyPSSWVc5pCw@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for Thinkbook 16P laptops.
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 9:11=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
> CS35L41 for Lenovo Thinkbook 16P laptops.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit 5cd471e3de782d1d5ae9e96909a08d264d8668=
42:
>
>    Merge branch 'amd-staging' into 'main' (2024-02-29 16:44:55 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware/ thinkbook16p

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/164

josh

>
> for you to fetch changes up to 81ee899e6d79a8c7a052591f9ec44974b29d0876:
>
>    linux-firmware: Add CS35L41 HDA Firmware for Lenovo Thinkbook 16P
> Laptops (2024-03-05 13:13:45 +0000)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>        linux-firmware: Add CS35L41 HDA Firmware for Lenovo Thinkbook 16P
> Laptops
>
>   WHENCE                                              |  20
> ++++++++++++++++++++
>   cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-l0.bin | Bin 0 -> 1560 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-r0.bin | Bin 0 -> 1560 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-l0.bin | Bin 0 -> 1560 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-r0.bin | Bin 0 -> 1556 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-l0.bin | Bin 0 -> 5544 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-r0.bin | Bin 0 -> 5544 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-l0.bin | Bin 0 -> 5496 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-r0.bin | Bin 0 -> 5496 byt=
es
>   9 files changed, 20 insertions(+)
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa38a9-spkid0-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa38ab-spkid0-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38a9-spkid0-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa38ab-spkid0-r0.bin
>

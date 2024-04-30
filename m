Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A03C10F16
	for <linux-firmware@archiver.kernel.org>; Tue, 30 Apr 2024 16:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F978C4AF65; Tue, 30 Apr 2024 16:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F55C4AF62
	for <linux-firmware@kernel.org>; Tue, 30 Apr 2024 16:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714494724;
	bh=F3wY3bKuKwo5dApjBA2lSevuX9Di9JSQRh/eF7vr5NY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=eJmC1AWya8rbfTB8sK2ZWmD/qw/vYgK+m5T4g5AGqI8tjIlccTICPZ7wJjgB1x0Eu
	 kveIRBOgjz84vQ0N3S9RNEy15kkilntnN9VN1M6/8wwraUUVs41LAKUGWSsDNSYIxK
	 HcYZ/oBuNrz8PfSzCLrlAL2wXo0tt4fEI6Xef9UKYp1HX9iOiE8GaBm4qJqEn/VhpS
	 i6nlTQAz++i2IW6+EoWINslUJ8g22O3TF6Lj7MrOfPDLRbeJRWqbhkEjZ7uFTT5zWC
	 indOS/3/Q8P60QaW6QRxPNtTg+tg0KYgYInkTTHI++KYk6V9slM40zNKjv9uHjX+Wu
	 HqdhLZTEan2Dw==
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so6306273276.1
        for <linux-firmware@kernel.org>; Tue, 30 Apr 2024 09:32:04 -0700 (PDT)
X-Gm-Message-State: AOJu0YwMlxADuStI+xpEeC4tgBzmZS25Q6VpUN/C1GPK0g0oymhcKfLn
	qWYkUxmgNA82i/xvyTC4tSS9VAX7JN95lfMWRb311Wt9i6K2GL/XDV0Hrf47cocDl1i6hmTpUVK
	doO2WQ0oOncXUiBkfsj+8Xu/wiVQ=
X-Google-Smtp-Source: AGHT+IG1ZnjPMJfs4TRO0PYuu4TU2W5CMljUQB0339dilJtptAFnFBk9PNBHaXynEUrmwxGJ+EjMsloOeWh+oQ67wEA=
X-Received: by 2002:a25:b183:0:b0:de5:d1cd:b580 with SMTP id
 h3-20020a25b183000000b00de5d1cdb580mr67322ybj.36.1714494723240; Tue, 30 Apr
 2024 09:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <001701da9b0b$223057b0$66910710$@opensource.cirrus.com>
In-Reply-To: <001701da9b0b$223057b0$66910710$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 30 Apr 2024 12:31:51 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4OTq+3TGOCnRqO9Ynn=knuvZDYOwChpje1GpUdR6YY2A@mail.gmail.com>
Message-ID: <CA+5PVA4OTq+3TGOCnRqO9Ynn=knuvZDYOwChpje1GpUdR6YY2A@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add Cirrus Logic firmware for some ASUS
 and Lenovo laptops
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 10:32=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> A couple of changes this week =E2=80=93 we=E2=80=99d like to add firmware=
 to support Cirrus Logic Smart amps
>
> on some ASUS and Lenovo laptops.
>
>
>
> Thanks,
>
> -Simon
>
>
>
>
>
> The following changes since commit fc21f475fee3f3e48a0e4c504df50ea488df90=
6d:
>
>
>
>   Merge branch 'robot/pr-0-1714105941' into 'main' (2024-04-26 04:55:58 +=
0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ 2004-04-30

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/204

josh

>
>
>
> for you to fetch changes up to d3a655e22101d79c75cdc0c5b0e9e888de848d07:
>
>
>
>   cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various ASUS lapto=
ps (2024-04-30 14:15:07 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (1):
>
>       cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various ASUS l=
aptops
>
>
>
> Stefan Binding (1):
>
>       linux-firmware: Add firmware and tuning for Lenovo Y770S
>
>
>
> WHENCE                                               |  34 ++++++++++++++=
++++++++++++++++++++
>
> cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid0-l0.bin  | Bin 0 -> 5680 byte=
s
>
> cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid0-r0.bin  | Bin 0 -> 5680 byte=
s
>
> cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid1-l0.bin  | Bin 0 -> 5704 byte=
s
>
> cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid1-r0.bin  | Bin 0 -> 5704 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp1.bin | Bin 0 -> 8196 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp2.bin | Bin 0 -> 8196 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid1-amp1.bin | Bin 0 -> 8192 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid1-amp2.bin | Bin 0 -> 8192 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid0-amp1.bin | Bin 0 -> 8192 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid0-amp2.bin | Bin 0 -> 8192 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid1-amp1.bin | Bin 0 -> 8196 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid1-amp2.bin | Bin 0 -> 8192 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431df3-amp1.bin        | Bin 0 -> 7812 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431df3-amp2.bin        | Bin 0 -> 7816 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431df3-amp3.bin        | Bin 0 -> 7812 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431df3-amp4.bin        | Bin 0 -> 7808 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp1.bin | Bin 0 -> 8196 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp2.bin | Bin 0 -> 8196 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp1.bin | Bin 0 -> 8192 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp2.bin | Bin 0 -> 8192 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp1.bin | Bin 0 -> 8196 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp2.bin | Bin 0 -> 8196 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp1.bin | Bin 0 -> 8192 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp2.bin | Bin 0 -> 8192 byte=
s
>
> 25 files changed, 34 insertions(+)
>
> create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid0-l0.bin
>
> create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid0-r0.bin
>
> create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid1-l0.bin
>
> create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa386e-spkid1-r0.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431c63-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431df3-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431df3-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431df3-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431df3-amp4.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp2.bin

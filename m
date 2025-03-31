Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA47C3600B
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Mar 2025 11:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32A55C4CEEB; Mon, 31 Mar 2025 11:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D18EC4CEE5
	for <linux-firmware@kernel.org>; Mon, 31 Mar 2025 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743421559;
	bh=nvGh0AyiAYh24uWP+fYQF0W0xMJ0iklAFzP5cRZLDHM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=UMFHX0HeK11NkbYJYrjsjypGNKS7tXhc3lN6SmvLNj/EJbry2A9scfiE95SYMbG/0
	 IudQQRsNTwNUI99YMVqZ8uEpf7294yoZNyXcZ4Ty84OGnp+y4D0WswtTHMc5Zl+k+K
	 a4CIBnuti9WRMBUakXIHXRKIiqR9OZT8HoBzT5SF2yofGibuDsXgRYTnVuyqZTxeVG
	 4F7PAqtXOm4yyB430qFE8wUtj4rIpt4WZx3SkZ1js65nxSsN8eIDgfJc8fuLb3tcNQ
	 VKvegunRTpZOnyf6z8+MlTxXG9ystfUo9etNLqnkMMuFzqUs+d37R3AAHEhmS1Du0r
	 ep7vqLOHx0EhA==
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e69483d136eso2812963276.3
        for <linux-firmware@kernel.org>; Mon, 31 Mar 2025 04:45:59 -0700 (PDT)
X-Gm-Message-State: AOJu0YwAeXcC7XV03mUfvlzNHR51Oh2trpHBKsSxJaCWcQW8mmBuPFX0
	3f2ILBY3K4RTQEebSeFaJTLEWwq++Blz0/O2SHFM95G3eFwdnXh5nFFSjFz1godGtYzRF4HG/4n
	Mq/cZYxFbNqVt23H1YzaEDCN/+dM=
X-Google-Smtp-Source: AGHT+IHl8mYdAr5cLcuq8Qo81F6ydhZBzdd0qZSaqq3RUnveR+qdj1OQyrFOAUf+ofMqbyQULNWTuaYsBnaCMwX2xdk=
X-Received: by 2002:a05:6902:2588:b0:e61:1c18:3f2f with SMTP id
 3f1490d57ef6-e6b8390f612mr8961539276.18.1743421558330; Mon, 31 Mar 2025
 04:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <a5902c2e-5d5b-4c8b-b84f-d1594956bf80@opensource.cirrus.com>
In-Reply-To: <a5902c2e-5d5b-4c8b-b84f-d1594956bf80@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 31 Mar 2025 07:45:46 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6-Xkfh6VWiZ1WyBJVszO0qgaUVOCEX+_W=Ezr6NBMA-g@mail.gmail.com>
X-Gm-Features: AQ5f1JrAGJhANwWRisl50Gu7IOrT4LJnfCPgcSle4KsGSVUZD6DsRaW4-8fdikw
Message-ID: <CA+5PVA6-Xkfh6VWiZ1WyBJVszO0qgaUVOCEX+_W=Ezr6NBMA-g@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for HP Laptops
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 1:56=E2=80=AFPM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp CS3=
5L41 for 2025 HP Laptops.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit a60087f7c9254065efb9e641b66af67e4c57b2=
9f:
>
>   Merge branch 'robot/patch-0-1742462166' into 'main' (2025-03-20 14:10:0=
5 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l41-20250321

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/496

josh

>
> for you to fetch changes up to 139c1b5faeddcaffb6466348f4f731533edaa008:
>
>   cirrus: cs35l41: Add Firmware for various HP Laptops using CS35L41 HDA =
(2025-03-21 17:52:52 +0000)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>       cirrus: cs35l41: Add Firmware for various HP Laptops using CS35L41 =
HDA
>
>  WHENCE                                           |  51 +++++++++++++++++=
++++++++++++++++++++++++++++++++++
>  cirrus/cs35l41-dsp1-spk-prot-103c8d9b-spkid0.bin | Bin 0 -> 4704 bytes
>  cirrus/cs35l41-dsp1-spk-prot-103c8d9b-spkid1.bin | Bin 0 -> 4700 bytes
>  cirrus/cs35l41-dsp1-spk-prot-103c8d9f-spkid0.bin | Bin 0 -> 4708 bytes
>  cirrus/cs35l41-dsp1-spk-prot-103c8d9f-spkid1.bin | Bin 0 -> 4712 bytes
>  cirrus/cs35l41-dsp1-spk-prot-103c8da0-spkid0.bin | Bin 0 -> 4716 bytes
>  cirrus/cs35l41-dsp1-spk-prot-103c8da0-spkid1.bin | Bin 0 -> 4712 bytes
>  cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin | Bin 0 -> 4804 bytes
>  cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid1.bin | Bin 0 -> 4796 bytes
>  9 files changed, 51 insertions(+)
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8d9b-spkid0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8d9b-spkid1.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8d9f-spkid0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8d9f-spkid1.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8da0-spkid0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8da0-spkid1.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid1.bin
>

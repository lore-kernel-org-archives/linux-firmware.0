Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614D2C83F25
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Jul 2025 18:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1996FC4CEF1; Mon, 21 Jul 2025 18:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03EABC4CEF4
	for <linux-firmware@kernel.org>; Mon, 21 Jul 2025 18:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753123994;
	bh=hMesET+xlOTM6LSH1H3tNTNYmKMM1F0WMEXsdzNYCxA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=OeQXUHXC+My8MhlxegypYYFWR2x/Vaz23uuvHCUtcvLzEiupk5gThO2By5xlhQ72J
	 EVjOHB+5fTdvTy4t/lkbXbZOuLglYdr/Q8mIkpk25guCwX+0yPM/exmiNj8/Bo9S4v
	 f36naOtKsB966i8+0FH/8PO5xU8VRb7RFj0RuM8aI8aQBqW/bKJPnDUR800omt150L
	 0iQP2ovPEQAtGXx/IroN63M6r4+ysP9HRS/XrpNYWClM8k9UOyVN7PsbMas4qPYR+8
	 YOIJSYIdYYq8oOhJvdAi72g7bYoeWAaMVYjkDMOdiqrbVUPKZqE1y9nLU5+fnCH728
	 J3yXkVFrzc4Ng==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e302191a3so43264637b3.2
        for <linux-firmware@kernel.org>; Mon, 21 Jul 2025 11:53:13 -0700 (PDT)
X-Gm-Message-State: AOJu0YweGDgYOFk2K40A69+d8Sgv6xXLZg7JwAYnqQOWfqg0W1sEVLPo
	O0bjrAmFkWAkyq2Sp1w/lDocbsBhQw378KI+uIS0kKYicuRNaBBttnFrTHlejtlIVQGyQpGINiM
	1cPsEw7BjgqLkyIDvfslxElqma8zVFUU=
X-Google-Smtp-Source: AGHT+IHXa2qc3Zj9FpabyczQII9tcmmAoDhGm3EyyfLGNmNjBKQetwdtJGG5TxdRs4dJUdxG2rVAs8li5X7ufxBZc0I=
X-Received: by 2002:a05:690c:4809:b0:70e:7638:a3a9 with SMTP id
 00721157ae682-7183516c9dbmr253413987b3.18.1753123993069; Mon, 21 Jul 2025
 11:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <000001dbf7df$3cb69d10$b623d730$@opensource.cirrus.com>
In-Reply-To: <000001dbf7df$3cb69d10$b623d730$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 21 Jul 2025 14:53:01 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4Z2ryDGY-UVwoNPj6exNVG57Oi8WiL1SDK-8d8YpAa=Q@mail.gmail.com>
X-Gm-Features: Ac12FXzcsnaanJZsdnUP_lGLXBUHPqkd84PoDba8dgDCUlIatYLJbQHiN2C4luw
Message-ID: <CA+5PVA4Z2ryDGY-UVwoNPj6exNVG57Oi8WiL1SDK-8d8YpAa=Q@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Amps for some
 Dell laptops
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2025 at 8:27=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> We=E2=80=99d like to add the firmware for the Cirrus CS35L56 smart amplif=
ier for some Dell Laptops.
>
> Thanks,
>
> -Simon
>
>
>
>
>
> The following changes since commit 6fc20e018cca0ab954fe249afb60ac5af69f10=
2a:
>
>
>
>   Merge branch 'license' into 'main' (2025-07-17 14:40:28 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l56-20250718

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/622

josh

>
>
>
> for you to fetch changes up to 66cc5ebaae28bcc0428b329679b3c377734fb483:
>
>
>
>   cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various Dell lapto=
ps (2025-07-18 13:17:26 +0100)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (1):
>
>       cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various Dell l=
aptops
>
>
>
> WHENCE                                               |  51 ++++++++++++++=
+++++++++++++++++++++++++++++++++++++
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp1.bin | Bin 0 -> 11524 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp2.bin | Bin 0 -> 11516 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp3.bin | Bin 0 -> 11524 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp4.bin | Bin 0 -> 11516 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp1.bin | Bin 0 -> 11528 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp2.bin | Bin 0 -> 11520 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp3.bin | Bin 0 -> 11528 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp4.bin | Bin 0 -> 11520 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp1.bin | Bin 0 -> 11508 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp2.bin | Bin 0 -> 11508 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp3.bin | Bin 0 -> 11508 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp4.bin | Bin 0 -> 11508 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp1.bin | Bin 0 -> 11504 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp2.bin | Bin 0 -> 11504 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp3.bin | Bin 0 -> 11504 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp4.bin | Bin 0 -> 11504 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp1.bin | Bin 0 -> 11508 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp2.bin | Bin 0 -> 11492 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp3.bin | Bin 0 -> 11508 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp4.bin | Bin 0 -> 11492 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp1.bin | Bin 0 -> 11508 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp2.bin | Bin 0 -> 11488 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp3.bin | Bin 0 -> 11508 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp4.bin | Bin 0 -> 11488 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp1.bin | Bin 0 -> 11520 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp2.bin | Bin 0 -> 11520 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp3.bin | Bin 0 -> 11520 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp4.bin | Bin 0 -> 11520 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp1.bin | Bin 0 -> 11520 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp2.bin | Bin 0 -> 11520 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp3.bin | Bin 0 -> 11520 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp4.bin | Bin 0 -> 11520 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp1.bin | Bin 0 -> 11508 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp2.bin | Bin 0 -> 11500 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp3.bin | Bin 0 -> 11508 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp4.bin | Bin 0 -> 11500 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp1.bin | Bin 0 -> 11516 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp2.bin | Bin 0 -> 11504 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp3.bin | Bin 0 -> 11516 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp4.bin | Bin 0 -> 11504 byt=
es
>
> cirrus/cs35l56/CS35L56_Rev3.11.28B.wmfw              | Bin 0 -> 37404 byt=
es
>
> 42 files changed, 51 insertions(+)
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp4.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp4.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp4.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp4.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp4.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp4.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp4.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp4.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp4.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp3.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp4.bin
>
> create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.28B.wmfw

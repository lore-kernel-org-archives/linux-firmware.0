Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A29C77B75
	for <linux-firmware@archiver.kernel.org>; Mon, 15 May 2023 11:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0921C433A0; Mon, 15 May 2023 11:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AAA4C4339E
	for <linux-firmware@kernel.org>; Mon, 15 May 2023 11:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684150634;
	bh=DPqZPfInRw6Q8BG+KIUBtHTsrbruZTuZDV1/5O7SVbI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=iFsfMjIW9x8Ioon/Nvg2/x0Mxn7c32QKfULCktFcTQP9CNq7Wqx0SZ+qkB93Is37R
	 lX8Q2qG33B6Lw0gBRJ0zncBNVISYkVkFBYOrOaKQDli1/pQHBZ0+ZZldFxGXivjsTD
	 XDGvQoq8cfywjORT0olKLOR2fJ2Z8jfeC/goBKQwaXyzucvmNUP6/kQCEg4skYCsBr
	 N6Uq5zkmdGgv6b02qWIo8PjqKiXXEBA3qh0bP6yOq4XZMXBk37y+VKCjAL4a71j6Ch
	 YwwTWc9YKjJLEMEwDPLDxWyF7yHbdwpN1zmgWDyynKEGIntHZlNt4qUgJaSdUmEQg0
	 T9o3mODIVJrcw==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-55af4277904so187373937b3.1
        for <linux-firmware@kernel.org>; Mon, 15 May 2023 04:37:14 -0700 (PDT)
X-Gm-Message-State: AC+VfDwxpD4itwf00qLit9do9NBClqjCYG6mEUvG9Asd4qgDGQZscMpq
	0yxQNmrbrcU6WoifsW9ekLENLDafRnVPuPGHPeU=
X-Google-Smtp-Source: ACHHUZ5TuyGpxzJUo4tX/tAJf81cI3ZLA4j0VZHwM+GhhdgXae6A8ySTsnbNCuB+zj89w+UbwwhvGIiAbZdnhdW93TY=
X-Received: by 2002:a81:6c42:0:b0:55a:1022:7814 with SMTP id
 h63-20020a816c42000000b0055a10227814mr31777779ywc.28.1684150633599; Mon, 15
 May 2023 04:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <ed062e9b-e301-46e4-419b-8fc91cf2cba8@opensource.cirrus.com>
In-Reply-To: <ed062e9b-e301-46e4-419b-8fc91cf2cba8@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 15 May 2023 07:37:03 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5TaEGB1Nqa7bRw4X6aPBxyQW6Ai3DjbPW9Cf388fjR2Q@mail.gmail.com>
Message-ID: <CA+5PVA5TaEGB1Nqa7bRw4X6aPBxyQW6Ai3DjbPW9Cf388fjR2Q@mail.gmail.com>
Subject: Re: [PULL linux-firmware] Add firmware for Lenovo ThinkPad P1 Gen 6
 and HP G10 series laptops
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 6:16=E2=80=AFAM Vitaly Rodionov
<vitalyr@opensource.cirrus.com> wrote:
>
> Hello,
>
> We would like to add firmware to support CirrusLogic smart amplifier CS35=
L41
>
> for  Lenovo ThinkPad P1 Gen 6 and HP G10 series laptops.
>
> Please, let me know if there are any problems.
>
> Thanks,
>
> Vitaly
>
>
> The following changes since commit 8451c2b1d529dc1a49328ac9235d3cf5bb8a8f=
cb:
>
>    mt76xx: Move the old Mediatek WiFi firmware to mediatek (2023-04-18
> 08:14:08 -0400)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware.git main
>
> for you to fetch changes up to fe5abf9dddde7db0350e08e819496f792e5f0c89:
>
>    cirrus: Add firmware and tuning files for HP G10 series laptops
> (2023-05-15 10:52:41 +0100)
>
> ----------------------------------------------------------------
> Vitaly Rodionov (2):
>        cirrus: Add firmware and tuning files for Lenovo ThinkPad P1 Gen 6
>        cirrus: Add firmware and tuning files for HP G10 series laptops

This fails check_whence.py with:

[jwboyer@vader linux-firmware]$ ./check_whence.py
E: cirrus/cs35l41-dsp1-spk-cali-103c8b26.bin not listed in WHENCE
E: cirrus/cs35l41-dsp1-spk-cali-103c8b74.bin not listed in WHENCE
E: cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r0.bin not listed in WHENCE
E: cirrus/cs35l41-dsp1-spk-prot-103c8b26.bin not listed in WHENCE
E: cirrus/cs35l41-dsp1-spk-prot-103c8b74.bin not listed in WHENCE
E: cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r1.bin not listed in WHENCE
[jwboyer@vader linux-firmware]$

Can you fix and resend?

josh

>
>   WHENCE                                              |  82
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++
>   cirrus/cs35l41-dsp1-spk-cali-103c8b26.bin           | Bin 0 -> 1868 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b42.bin           | Bin 0 -> 1868 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b43.bin           | Bin 0 -> 1892 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b44.bin           | Bin 0 -> 1884 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b45.bin           | Bin 0 -> 1868 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b47.bin           | Bin 0 -> 1888 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b63-l0.bin        | Bin 0 -> 1964 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b63-l1.bin        | Bin 0 -> 1968 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b63-r0.bin        | Bin 0 -> 1964 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b63-r1.bin        | Bin 0 -> 1968 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b74.bin           | Bin 0 -> 1868 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r0.bin        | Bin 0 -> 1952 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r1.bin        | Bin 0 -> 1952 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin           | Bin 0 -> 1856 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-l0.bin | Bin 0 -> 1592 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-r0.bin | Bin 0 -> 1592 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-l0.bin | Bin 0 -> 1608 byt=
es
>   cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-r0.bin | Bin 0 -> 1608 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8b26.bin           | Bin 0 -> 4816 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8b42.bin           | Bin 0 -> 4816 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8b43.bin           | Bin 0 -> 4840 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8b44.bin           | Bin 0 -> 4928 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8b45.bin           | Bin 0 -> 4820 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8b47.bin           | Bin 0 -> 4920 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8b63-l0.bin        | Bin 0 -> 5408 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8b63-l1.bin        | Bin 0 -> 5448 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8b63-r0.bin        | Bin 0 -> 5408 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8b63-r1.bin        | Bin 0 -> 5448 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8b74.bin           | Bin 0 -> 4900 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r0.bin        | Bin 0 -> 5416 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r1.bin        | Bin 0 -> 5388 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-103c8b92.bin           | Bin 0 -> 4816 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-l0.bin | Bin 0 -> 4908 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-r0.bin | Bin 0 -> 4908 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-l0.bin | Bin 0 -> 4924 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-r0.bin | Bin 0 -> 4876 byt=
es
>   37 files changed, 82 insertions(+)
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b26.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b42.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b43.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b44.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b45.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b47.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-l1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-r1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b74.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b26.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b42.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b43.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b44.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b45.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b47.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b63-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b63-l1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b63-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b63-r1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b74.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b92.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-r0.bin
>

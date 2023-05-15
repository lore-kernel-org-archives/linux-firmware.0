Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C1DC7EE23
	for <linux-firmware@archiver.kernel.org>; Mon, 15 May 2023 17:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2ADF9C4339C; Mon, 15 May 2023 17:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A74C433EF
	for <linux-firmware@kernel.org>; Mon, 15 May 2023 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684171529;
	bh=vYIMZ+hgUiGnJjkxrO0Xn0GehIBriCpviFDqidtaTmI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=sFbEXPxLlNoKLxJf29+wFUfau4AOm5muLDFOczevCp7j9pmQ7FwzxFp8rNDqfoF7o
	 RLBWDPKGm2dq3exgiEb5oJH5yCWPN9YR2hAPEXpVLFPEnJVisg7/WtkRuKoMt4VwTZ
	 1SDd/Z/bWvMqLJedoLLPaNyA4FN2aaxvS/KXwT8c6v6Q/FS0M5Du1n4PBpQ0SNCFgu
	 i/XBNZnENqm9XhgvvFokgxYfEvxR0dT31cTwE/Anp1XvcfUuYRXBJI28oE5zcqdrNV
	 +rUfqOcTMygFgODBWoQEccTiKFeqtJMTYiWKpWqbwYhpi2YdFDQjp8Eb0yVjujTP0d
	 oDOwg36OVaHsg==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-b9e27684b53so11643824276.0
        for <linux-firmware@kernel.org>; Mon, 15 May 2023 10:25:29 -0700 (PDT)
X-Gm-Message-State: AC+VfDw3RmIRrVLjxqEPQ/MtIwYT2NbvKjBAW+GFyCKnJ0ogUYcALeqk
	a4Jp7PYYdr6P5DGRxfYR3hiKvzrYnFWhzeSp6Ss=
X-Google-Smtp-Source: ACHHUZ7dbIiH3t/xsCYtDPaOkircLeXCWumULOLyQtvcHp8/4N/fqrFCIisIgOqCREt2LzW0a3S1R0F2H5DPnnm/aLY=
X-Received: by 2002:a25:fc0a:0:b0:b8f:6ebd:4030 with SMTP id
 v10-20020a25fc0a000000b00b8f6ebd4030mr29002220ybd.51.1684171528096; Mon, 15
 May 2023 10:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <218e5f67-02b4-7eee-e999-8ef1815b3bfc@opensource.cirrus.com>
In-Reply-To: <218e5f67-02b4-7eee-e999-8ef1815b3bfc@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 15 May 2023 13:25:17 -0400
X-Gmail-Original-Message-ID: <CA+5PVA55fdFLF4coVodkNC+QYHofOHBLxJNshOR4+MRLW6XnBA@mail.gmail.com>
Message-ID: <CA+5PVA55fdFLF4coVodkNC+QYHofOHBLxJNshOR4+MRLW6XnBA@mail.gmail.com>
Subject: Re: [PULL v2 linux-firmware] Add firmware for Lenovo ThinkPad P1 Gen
 6 and HP G10 series laptops
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 11:29=E2=80=AFAM Vitaly Rodionov
<vitalyr@opensource.cirrus.com> wrote:
>
> Hello,
>
> Sorry, mistake is now corrected. make check - no errors. Please, see
> pull request below.
>
> Changes since version 1:
>
>   - removed extra files
>
>   - added missing firmware files
>
>   - links corrected
>
> Thanks,
> Vitaly
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

Thank you.  Pulled and pushed out.

josh

>
> for you to fetch changes up to cc628d657e2d516bef3e0955042df07e5a35eb16:
>
>    cirrus: Add firmware and tuning files for HP G10 series laptops
> (2023-05-15 16:19:11 +0100)
>
> ----------------------------------------------------------------
> Vitaly Rodionov (2):
>        cirrus: Add firmware and tuning files for Lenovo ThinkPad P1 Gen 6
>        cirrus: Add firmware and tuning files for HP G10 series laptops
>
>   WHENCE                                             |  86
> +++++++++++++++++++++
>   cirrus/cs35l41-dsp1-spk-cali-103c8b42.bin          | Bin 0 -> 1868 byte=
s
>   cirrus/cs35l41-dsp1-spk-cali-103c8b43.bin          | Bin 0 -> 1892 byte=
s
>   cirrus/cs35l41-dsp1-spk-cali-103c8b44.bin          | Bin 0 -> 1884 byte=
s
>   cirrus/cs35l41-dsp1-spk-cali-103c8b45.bin          | Bin 0 -> 1868 byte=
s
>   cirrus/cs35l41-dsp1-spk-cali-103c8b47.bin          | Bin 0 -> 1888 byte=
s
>   cirrus/cs35l41-dsp1-spk-cali-103c8b63-l0.bin       | Bin 0 -> 1964 byte=
s
>   cirrus/cs35l41-dsp1-spk-cali-103c8b63-l1.bin       | Bin 0 -> 1968 byte=
s
>   cirrus/cs35l41-dsp1-spk-cali-103c8b63-r0.bin       | Bin 0 -> 1964 byte=
s
>   cirrus/cs35l41-dsp1-spk-cali-103c8b63-r1.bin       | Bin 0 -> 1968 byte=
s
>   cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r0.bin       | Bin 0 -> 1952 byte=
s
>   cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r1.bin       | Bin 0 -> 1952 byte=
s
>   cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin          | Bin 0 -> 1856 byte=
s
>   .../cs35l41-dsp1-spk-cali-17aa2316-spkid0-l0.bin   | Bin 0 -> 1592 byte=
s
>   .../cs35l41-dsp1-spk-cali-17aa2316-spkid0-r0.bin   | Bin 0 -> 1592 byte=
s
>   .../cs35l41-dsp1-spk-cali-17aa2316-spkid1-l0.bin   | Bin 0 -> 1608 byte=
s
>   .../cs35l41-dsp1-spk-cali-17aa2316-spkid1-r0.bin   | Bin 0 -> 1608 byte=
s
>   cirrus/cs35l41-dsp1-spk-prot-103c8b42.bin          | Bin 0 -> 4816 byte=
s
>   cirrus/cs35l41-dsp1-spk-prot-103c8b43.bin          | Bin 0 -> 4840 byte=
s
>   cirrus/cs35l41-dsp1-spk-prot-103c8b44.bin          | Bin 0 -> 4928 byte=
s
>   cirrus/cs35l41-dsp1-spk-prot-103c8b45.bin          | Bin 0 -> 4820 byte=
s
>   cirrus/cs35l41-dsp1-spk-prot-103c8b47.bin          | Bin 0 -> 4920 byte=
s
>   cirrus/cs35l41-dsp1-spk-prot-103c8b63-l0.bin       | Bin 0 -> 5408 byte=
s
>   cirrus/cs35l41-dsp1-spk-prot-103c8b63-l1.bin       | Bin 0 -> 5448 byte=
s
>   cirrus/cs35l41-dsp1-spk-prot-103c8b63-r0.bin       | Bin 0 -> 5408 byte=
s
>   cirrus/cs35l41-dsp1-spk-prot-103c8b63-r1.bin       | Bin 0 -> 5448 byte=
s
>   cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r0.bin       | Bin 0 -> 5416 byte=
s
>   cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r1.bin       | Bin 0 -> 5388 byte=
s
>   cirrus/cs35l41-dsp1-spk-prot-103c8b92.bin          | Bin 0 -> 4816 byte=
s
>   .../cs35l41-dsp1-spk-prot-17aa2316-spkid0-l0.bin   | Bin 0 -> 4908 byte=
s
>   .../cs35l41-dsp1-spk-prot-17aa2316-spkid0-r0.bin   | Bin 0 -> 4908 byte=
s
>   .../cs35l41-dsp1-spk-prot-17aa2316-spkid1-l0.bin   | Bin 0 -> 4924 byte=
s
>   .../cs35l41-dsp1-spk-prot-17aa2316-spkid1-r0.bin   | Bin 0 -> 4876 byte=
s
>   33 files changed, 86 insertions(+)
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b42.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b43.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b44.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b45.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b47.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-l1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b63-r1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b8f-r1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-103c8b92.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-cali-17aa2316-spkid1-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b42.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b43.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b44.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b45.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b47.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b63-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b63-l1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b63-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b63-r1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b8f-r1.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8b92.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa2316-spkid1-r0.bin
>

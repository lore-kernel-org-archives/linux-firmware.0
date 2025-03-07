Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A9EC19F32
	for <linux-firmware@archiver.kernel.org>; Fri,  7 Mar 2025 09:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E737AC4CEE8; Fri,  7 Mar 2025 09:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1333C4CED1
	for <linux-firmware@kernel.org>; Fri,  7 Mar 2025 09:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741340974;
	bh=0O+bPR9fMmHKHW4eSSz26VsBQ0YIW5tL/RB7FdYoGnU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=aVG2oeuujYwsxs0vNTE3Gw7AJBOZXlKaP65/D/ra46YrPlrWWgmevb2F96M7nsaS/
	 ALGur26m9095nxVHumi3pe00UPpnbpFi7l7KwTMdtq1zmEIme5Mx7HFIGeByNxr1qO
	 al5FLx+c1P0MHL4sYRYKRAUlHcefXVegh0MChr3dIUxcMhA94xgwLAnlRFuVYiEZwF
	 obe7eRHyN/xJiMA2zKlD0AQ2KfNyA/5v4smQDT8dSLgbpj1hJF+i6fqSERf69FSV0c
	 ejg2MtrDJbKWHDURYf8opkGUXvDIAwJdGTAjAfFD8WNSjjYg6Ds/35OERfpwn0cn0r
	 T5FTawPSHbi+w==
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e549be93d5eso1479993276.1
        for <linux-firmware@kernel.org>; Fri, 07 Mar 2025 01:49:34 -0800 (PST)
X-Gm-Message-State: AOJu0YxAMSNVBdr9uk2EShZ/HARIrqjfBIVUbFmDXBpcrNHqB7ENoHCx
	jWxLj8Xsn/rx8lnORYXR82AFXb4lhdjWWzmtvfyzdGmzAC+H81oTblXs1zM5HrAGd3MlgP2NquU
	GpTU2HGJS5CK9hEAyWiGY/v0JveU=
X-Google-Smtp-Source: AGHT+IENuiV9g/Ybu5hFJmkd1GNWqsqAlDOAfrfv4B/rGM0eQY3nalFxjKbkiwARyjmh5y/jcu5DZ4g6FvEdZGgxdpE=
X-Received: by 2002:a05:6902:701:b0:e5a:ca6b:4531 with SMTP id
 3f1490d57ef6-e635c13860fmr3389553276.12.1741340974031; Fri, 07 Mar 2025
 01:49:34 -0800 (PST)
MIME-Version: 1.0
References: <9acb4fa7-47a8-4261-a086-e443fd6de568@opensource.cirrus.com>
In-Reply-To: <9acb4fa7-47a8-4261-a086-e443fd6de568@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 7 Mar 2025 09:49:23 +0000
X-Gmail-Original-Message-ID: <CA+5PVA7m9ibvaO196t0+-xqjksDi3P+JPz_KjPzqOvKOq6casA@mail.gmail.com>
X-Gm-Features: AQ5f1JoR7LI5ZBYhyrTdFbHd274P0ZsnJjsIqck0qibGMSFgcT138aVJul4nZd4
Message-ID: <CA+5PVA7m9ibvaO196t0+-xqjksDi3P+JPz_KjPzqOvKOq6casA@mail.gmail.com>
Subject: Re: [PULL v2 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for various ASUS laptops
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/467

josh

On Thu, Mar 6, 2025 at 11:09=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp CS3=
5L41 for various ASUS laptops.
> Changes from v1: Fixed missing firmware files in patch.
>
> Thanks,
>
> Stefan Binding
>
>
> The following changes since commit a3e1417a176de3f1cda1c504d6d060ff990c91=
4b:
>
>   Merge branch 'robot/patch-0-1741163658' into 'main' (2025-03-05 12:42:0=
6 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l41-20250305
>
> for you to fetch changes up to 675b89218fe1630f5aabfe08285157deb4a06120:
>
>   cirrus: cs35l41: Add firmware and tuning for ASUS Consumer laptops (202=
5-03-06 01:01:24 +0000)
>
> ----------------------------------------------------------------
> Stefan Binding (2):
>       cirrus: cs35l41: Add Firmware for various ASUS Commercial laptops
>       cirrus: cs35l41: Add firmware and tuning for ASUS Consumer laptops
>
>  WHENCE                                              | 111 ++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++
>  cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-l0.bin | Bin 0 -> 4908 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-r0.bin | Bin 0 -> 4908 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-l0.bin | Bin 0 -> 4908 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-r0.bin | Bin 0 -> 4912 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-l0.bin | Bin 0 -> 4936 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-r0.bin | Bin 0 -> 4936 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-l0.bin | Bin 0 -> 4936 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-r0.bin | Bin 0 -> 4936 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10431f63-l0.bin        | Bin 0 -> 3936 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10431f63-r0.bin        | Bin 0 -> 3928 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-l0.bin | Bin 0 -> 4432 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-r0.bin | Bin 0 -> 4432 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-l0.bin | Bin 0 -> 4432 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-r0.bin | Bin 0 -> 4432 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-l0.bin | Bin 0 -> 5220 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-r0.bin | Bin 0 -> 5204 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-l0.bin | Bin 0 -> 4904 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-r0.bin | Bin 0 -> 4908 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin | Bin 0 -> 4892 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin | Bin 0 -> 4892 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-l0.bin | Bin 0 -> 4912 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bin | Bin 0 -> 2096 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bin | Bin 0 -> 4916 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bin | Bin 0 -> 2100 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-l0.bin | Bin 0 -> 4908 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-r0.bin | Bin 0 -> 4908 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-l0.bin | Bin 0 -> 4908 byte=
s
>  cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-r0.bin | Bin 0 -> 4908 byte=
s
>  29 files changed, 111 insertions(+)
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431074-spkid0-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431074-spkid1-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431194-spkid0-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431194-spkid1-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431f63-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431f63-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid0-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433061-spkid0-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433071-spkid0-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104330c1-spkid0-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid0-r0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-l0.bin
>  create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433e20-spkid1-r0.bin
>

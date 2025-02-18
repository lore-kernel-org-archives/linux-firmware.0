Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6297C021AA
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Feb 2025 17:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E79DC4CEE9; Tue, 18 Feb 2025 17:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54761C4CEE4
	for <linux-firmware@kernel.org>; Tue, 18 Feb 2025 17:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739901403;
	bh=dVxpldPQzGI/6gF4BTuEXG1792YNRTpoag8KdSMftqU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qPLLa6kF1cg8yuuxC/ibcMztkBG7h4lSD46BmTDFBVmeuFC9wC+r4GAm9sXmNxpmI
	 36KyX8XMBBvqD4ZpM8ZDIeyeg51wrIU2u+c3pQrIejURPWPP03caTrhpWlbMz+t8nm
	 /nrEfMdnMoBs4glt6PwrU+F1RUrmzmg1ezWVv1NT889V/fp8jiNKlA2STNDsHuIZjz
	 iuwbdHaSzjQKTLNABdHd5vsk2Jruh/TQNyXa4xfPz38zHOJsWeQEuCJrtSV92Xfv0+
	 PhAFcW640BYKaDBCAcaLiHaYdfAcngONtyGK2BCcDDf3yQqbV+Q7zgasI+QL+1GNBf
	 I9bUH9TFhLgtg==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e5ad75ca787so42454276.0
        for <linux-firmware@kernel.org>; Tue, 18 Feb 2025 09:56:43 -0800 (PST)
X-Gm-Message-State: AOJu0Yw+XQhqJnir+ij92yPJ5+1KZb6yAbIczvuT139j2vVnR4WieuUa
	sxPSEmF75KlpaJONtt62yv7nA34omPtL0hlunp8tZVsjZTPOjaopwYLxt9gBzKZtnRBjdTSIva7
	HLl1bwY4KidZ3HqBQE0K8ryArrCo=
X-Google-Smtp-Source: AGHT+IH6kDg7/xFS2E8IVwuB9EgosG0/VfIa7lN7t1ubKZtdS58Vsesco8cBKXYC4YuexWU7ddZGuinIzg0pvA9qceU=
X-Received: by 2002:a05:6902:2182:b0:e5d:9246:ebdd with SMTP id
 3f1490d57ef6-e5e09b0beb2mr891342276.21.1739901402409; Tue, 18 Feb 2025
 09:56:42 -0800 (PST)
MIME-Version: 1.0
References: <003c01db8220$91ce91c0$b56bb540$@opensource.cirrus.com>
In-Reply-To: <003c01db8220$91ce91c0$b56bb540$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 18 Feb 2025 12:56:31 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5CnAdws3W=+tbxEjRPi=8MR3AX3kJF6nhTsT1ozDL5EA@mail.gmail.com>
X-Gm-Features: AWEUYZlp0PFAeXQCBB14dQ4cbycz0UMv1dT3SjjWBI-VAsYMZt9N1j3n2w90nds
Message-ID: <CA+5PVA5CnAdws3W=+tbxEjRPi=8MR3AX3kJF6nhTsT1ozDL5EA@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Update firmware for Cirrus CS35L56 Amps
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 11:17=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> We=E2=80=99d like to update the firmware for the Cirrus CS35L56 smart amp=
lifier.
>
>
>
> There are four patches today adding and updating support for several
>
> products from Dell, Lenovo, HP and ASUS.
>
> Thanks,
>
> -Simon
>
>
>
>
>
> The following changes since commit 4431686f4f45f1bcf0712b896b21413d991f05=
21:
>
>
>
>   Merge branch 'en8811h' into 'main' (2025-02-18 13:01:56 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l56-20250218

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/453

josh

>
>
>
> for you to fetch changes up to 307af4cea232fd663f6ef9890d90dc4f300d9e7a:
>
>
>
>   cirrus: cs35l56: Add and update firmware for Cirrus CS35L56 for two HP =
laptops (2025-02-18 16:09:05 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (4):
>
>       cirrus: cs35l56: Update firmware for Cirrus Amps for some Dell lapt=
ops
>
>       cirrus: cs35l56: Add and update firmware for Cirrus CS35L56 for var=
ious Lenovo laptops
>
>       cirrus: cs35l56: Add firmware for Cirrus Amps for some ASUS laptops
>
>       cirrus: cs35l56: Add and update firmware for Cirrus CS35L56 for two=
 HP laptops
>
>
>
> WHENCE                                                              |  60=
 +++++++++++++++++++++++++++++++++++++++++++++++++++---------
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp1.bin                       | Bin=
 7500 -> 7508 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp2.bin                       | Bin=
 7464 -> 7472 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp3.bin                       | Bin=
 7468 -> 7476 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp4.bin                       | Bin=
 7500 -> 7508 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp1.bin                       | Bin=
 0 -> 7508 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp2.bin                       | Bin=
 0 -> 7472 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp3.bin                       | Bin=
 0 -> 7476 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp4.bin                       | Bin=
 0 -> 7508 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp1.bin                | Bin=
 11532 -> 11532 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp2.bin                | Bin=
 11532 -> 11532 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp1.bin                | Bin=
 11532 -> 11528 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid1-amp2.bin                | Bin=
 11532 -> 11528 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp1.bin                | Bin=
 11532 -> 11524 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp2.bin                | Bin=
 11532 -> 11524 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp1.bin                | Bin=
 11532 -> 11524 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid1-amp2.bin                | Bin=
 11532 -> 11524 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp1.bin                | Bin=
 0 -> 8264 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp2.bin                | Bin=
 0 -> 8264 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp1.bin                | Bin=
 0 -> 8256 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp2.bin                | Bin=
 0 -> 8256 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid1-ampl.bin                | Bin=
 8628 -> 8580 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa380e-spkid1-ampr.bin                | Bin=
 8628 -> 8584 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampl.bin                | Bin=
 0 -> 6772 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampr.bin                | Bin=
 0 -> 6776 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampl.bin                | Bin=
 0 -> 6768 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampr.bin                | Bin=
 0 -> 6772 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp1.bin                       | Bin=
 7456 -> 7840 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp2.bin                       | Bin=
 7456 -> 7840 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa390b-amp1.bin                       | Bin=
 0 -> 6680 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa390b-amp2.bin                       | Bin=
 0 -> 6680 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp1.bin                | Bin=
 0 -> 6684 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp2.bin                | Bin=
 0 -> 6684 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp1.bin                | Bin=
 0 -> 6684 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp2.bin                | Bin=
 0 -> 6684 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp1.bin                | Bin=
 0 -> 6708 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp2.bin                | Bin=
 0 -> 6708 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp1.bin                | Bin=
 0 -> 6688 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp2.bin                | Bin=
 0 -> 6688 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin                | Bin=
 0 -> 8348 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin                | Bin=
 0 -> 8348 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin                | Bin=
 0 -> 6200 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin                | Bin=
 0 -> 6200 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin                | Bin=
 0 -> 6212 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin                | Bin=
 0 -> 6212 bytes
>
> cirrus/cs35l56/{CS35L56_Rev3.11.27.wmfw =3D> CS35L56_Rev3.11.21.wmfw} | B=
in 34964 -> 33364 bytes
>
> 46 files changed, 51 insertions(+), 9 deletions(-)
>
> create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp1.bin
>
> create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp2.bin
>
> create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp3.bin
>
> create mode 100644 cirrus/cs35l54-b0-dsp1-misc-103c8d08-amp4.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431044-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampl.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampr.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampl.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampr.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa390b-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa390b-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa390c-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa390d-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3910-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3911-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin
>
> rename cirrus/cs35l56/{CS35L56_Rev3.11.27.wmfw =3D> CS35L56_Rev3.11.21.wm=
fw} (52%)
>
>

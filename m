Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35040C00140
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Aug 2022 13:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7B89C433B5; Mon, 15 Aug 2022 13:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCC2C433D7
	for <linux-firmware@kernel.org>; Mon, 15 Aug 2022 13:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660568587;
	bh=9RapcVpviEHeofxzbE1k9KkhvwnPl+8hZoJerVMaVj8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=PWJgTaUmV8/ROWvWDkCwkKZBGeWDiip8/QsXRPTmkLvqm4L6ATS/seE2BvY/cTqve
	 aiqRAypBnErwYHqAGrtsysxjYo+UAfjCCUNHAOIwY7bRLWIwH6xWTevkA8xGD4vJEz
	 oq0nx5lTszBor8tLiQM/PZXM/ZhKCNXFHRdP5oPsFXWpH5/4wpi2TPGeOlhohn+2NX
	 5ZmF+KFskroA4sSdZA3uzYo+1PYB1IIqhDCUeGUMmGiBNkwj/dU4ftStiK2Th5iupq
	 qWp/gNqEVc3ej6fet3vdIjRicQ8qRRB/GQW8VpDS9GyMULgNCGks0q/99YmyT9Y9r7
	 uBbAMyP2iacnw==
Received: by mail-io1-f50.google.com with SMTP id i77so2262231ioa.7
        for <linux-firmware@kernel.org>; Mon, 15 Aug 2022 06:03:07 -0700 (PDT)
X-Gm-Message-State: ACgBeo1GjDKG6fDwdMttV5TooyERC/C+UDvfgmQczms46MVxKmqIHkhj
	ocQAZh7I4vmU+kb7ElAGACtO54OF9VB1SNp1xYc=
X-Google-Smtp-Source: AA6agR6HUrnFvlxW3L1qWRQyqIc0zenVb0EN/8WkdYN2JrrIAaXESEa05fc1oUJldfJ/QSw6DBshl/nV98HhDDEkxgA=
X-Received: by 2002:a5d:9408:0:b0:688:189d:267f with SMTP id
 v8-20020a5d9408000000b00688189d267fmr2773484ion.55.1660568586894; Mon, 15 Aug
 2022 06:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <9a79936b-70e2-f964-55ac-e2be8e9346ed@lenovo.com>
 <CA+5PVA6NCSn6ZsVELY0-mW9v82n6Xro2eVkMAcx=LppgMMC2UQ@mail.gmail.com> <c0fcdd91-ad52-0c69-4f6b-343cc8c8da56@lenovo.com>
In-Reply-To: <c0fcdd91-ad52-0c69-4f6b-343cc8c8da56@lenovo.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 15 Aug 2022 09:02:56 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4cJRfCLK_-irY7c0M1-_PR1AHxVCYqhX=FpDR8ewA6pQ@mail.gmail.com>
Message-ID: <CA+5PVA4cJRfCLK_-irY7c0M1-_PR1AHxVCYqhX=FpDR8ewA6pQ@mail.gmail.com>
Subject: Re: [External] Re: qcom: Add firmware for Lenovo ThinkPad X13s
To: Mark Pearson <markpearson@lenovo.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, bjorn.andersson@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 4, 2022 at 7:53 AM Mark Pearson <markpearson@lenovo.com> wrote:
>
> Hi Josh,
>
> On 8/4/22 07:50, Josh Boyer wrote:
> > On Wed, Aug 3, 2022 at 4:37 PM Mark Pearson <markpearson@lenovo.com> wrote:
> >>
> >> The following changes since commit 150864a4d73e8c448eb1e2c68e65f07635fe1a66:
> >>
> >>   amdgpu partially revert "amdgpu: update beige goby to release 22.20"
> >> (2022-07-25 14:16:04 -0400)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://github.com/mrhpearson/linux-firmware lenovo-thinkpad-x13s
> >>
> >> for you to fetch changes up to 4ae4ae88918928e15006eb129ad981aa58216b59:
> >>
> >>   qcom: Add firmware for Lenovo ThinkPad X13s (2022-08-03 16:29:07 -0400)
> >>
> >> ----------------------------------------------------------------
> >> Mark Pearson (1):
> >>       qcom: Add firmware for Lenovo ThinkPad X13s
> >>
> >>  WHENCE                             |   8 ++++++++
> >>  qcom/LENOVO/21BX/adspr.jsn         |  28 ++++++++++++++++++++++++++++
> >>  qcom/LENOVO/21BX/adspua.jsn        |  29 +++++++++++++++++++++++++++++
> >>  qcom/LENOVO/21BX/battmgr.jsn       |  22 ++++++++++++++++++++++
> >>  qcom/LENOVO/21BX/cdspr.jsn         |  22 ++++++++++++++++++++++
> >>  qcom/LENOVO/21BX/qcadsp8280.mbn    | Bin 0 -> 14367860 bytes
> >>  qcom/LENOVO/21BX/qccdsp8280.mbn    | Bin 0 -> 3575808 bytes
> >>  qcom/LENOVO/21BX/qcdxkmsuc8280.mbn | Bin 0 -> 14392 bytes
> >>  qcom/LENOVO/21BX/qcslpi8280.mbn    | Bin 0 -> 6213632 bytes
> >>  9 files changed, 109 insertions(+)
> >>  create mode 100644 qcom/LENOVO/21BX/adspr.jsn
> >>  create mode 100644 qcom/LENOVO/21BX/adspua.jsn
> >>  create mode 100644 qcom/LENOVO/21BX/battmgr.jsn
> >>  create mode 100644 qcom/LENOVO/21BX/cdspr.jsn
> >>  create mode 100755 qcom/LENOVO/21BX/qcadsp8280.mbn
> >>  create mode 100755 qcom/LENOVO/21BX/qccdsp8280.mbn
> >>  create mode 100755 qcom/LENOVO/21BX/qcdxkmsuc8280.mbn
> >>  create mode 100755 qcom/LENOVO/21BX/qcslpi8280.mbn
> >> [banther@p1g4 linux-firmware]$ git log -1
> >> commit 4ae4ae88918928e15006eb129ad981aa58216b59 (HEAD ->
> >> lenovo-thinkpad-x13s)
> >> Author: Mark Pearson <markpearson@lenovo.com>
> >> Date:   Wed Aug 3 13:49:42 2022 -0400
> >>
> >>     qcom: Add firmware for Lenovo ThinkPad X13s
> >>
> >>     Add runtime loaded firmware for the audio, compute and sensor DSPs, as
> >>     well as the zap shader for the GPU on the Lenovo ThinkPad X13s.
> >>
> >>     The files are placed under qcom/ as some distributions distribute
> >>     linux-firmware as multiple packages and the qcom-specific package will
> >>     be needed to provide some of the shared GPU files.
> >>
> >>     Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> >
> > Just so I make sure I understand, is the firmware provided by Qualcomm
> > itself, or did Lenovo author it?  As of right now, it looks like
> > Lenovo releasing Qualcomm firmware under the existing LICENSE.qcom,
> > which is slightly odd.  Normally we'd like to see a Signed-off-by or
> > Reviewed-by statement from the owner of the firmware if a partner
> > company is releasing it to ensure it was intended to be released.
> >
> > josh
> The firmware is from Qualcomm but is done for Lenovo for the X13s.
>
> My understanding is we (Lenovo) are the 'owner'. I have discussed
> releasing this with Qualcomm and they are supporting us with this and
> have approved me doing this release.

Pulled and pushed out.

josh

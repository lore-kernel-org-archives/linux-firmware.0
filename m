Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D293C4363A
	for <linux-firmware@archiver.kernel.org>; Fri, 23 Oct 2020 12:06:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 25F3F24248; Fri, 23 Oct 2020 12:06:01 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id ED25420EDD
	for <linux-firmware@kernel.org>; Fri, 23 Oct 2020 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603454761;
	bh=HM2EfumIMPvy7zLqBOFENGsu/uaB8YcE55+EvPiw+gk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=l/EC/dkKkUo/mcyxFqdGnHTGBV1YZ7aC5+b9sG3EKZjb5A7K5YAUnEbgY1kBUCQHW
	 n8kJpdCVPlMtlmnNet5VqHbnC382aDGvRv9tYy5kNuquMQYCAnWKqz1UlQc0u1/0vh
	 NqybhJDUcn1UGlp4qRrgRZ4oe5vqX2c6GJtoiOo8=
Received: by mail-io1-f42.google.com with SMTP id p15so1474385ioh.0
        for <linux-firmware@kernel.org>; Fri, 23 Oct 2020 05:06:00 -0700 (PDT)
X-Gm-Message-State: AOAM533n6EjRmqxA6XTiquEEB1CvSuYH9SKjwnuUVSfZakgyznUtaWA1
	Li4Z5I8Bl3WskiR5s8PVjoYk6cS7/Isio53cvFs=
X-Google-Smtp-Source: ABdhPJzn+egfTDXMlr27EinypWoWWPWlBnjMbBBocaonk7iwpQ3Y7AnNn8F8xoRfuDOhg6PUE8vuGlbLEKobCncET5g=
X-Received: by 2002:a05:6638:2512:: with SMTP id v18mr1667480jat.106.1603454760266;
 Fri, 23 Oct 2020 05:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <290a085b0fb686ce6aacbd02be560e52@codeaurora.org> <dfbf51326d00ae72ed2b6149e7ccf570@codeaurora.org>
In-Reply-To: <dfbf51326d00ae72ed2b6149e7ccf570@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 23 Oct 2020 08:05:49 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6aDspcdPFoLR_BbQcPzMpsfo3O6KWiRf+tTuAq11skMQ@mail.gmail.com>
Message-ID: <CA+5PVA6aDspcdPFoLR_BbQcPzMpsfo3O6KWiRf+tTuAq11skMQ@mail.gmail.com>
Subject: Re: Update venus firmware files for v5.4
To: asitshah@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mauro Carvalho Chehab <mchehab@infradead.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-media-owner@vger.kernel.org, 
	vgarodia@codeaurora.org, dikshita@codeaurora.org
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Tue, Oct 20, 2020 at 1:47 AM <asitshah@codeaurora.org> wrote:
>
> Hi Team,
>
> Gentle Reminder. Please let me know if anything is missing.
>
> Regards,
> Asit
>
>
> On 2020-10-08 15:20, asitshah@codeaurora.org wrote:
> > Hi Team,
> >
> > Please include updated Venus Firmware bins for v5.4.
> >
> > Snapshot of pull request is as below, let me know if anything is
> > missing.
> >
> >>>>>>>
> >
> > The following changes since commit
> > 00a84c516078defb76fbd57543b8d5c674a9a2be:
> >
> >   linux-firmware: Update AMD SEV firmware (2020-09-16 08:01:44 -0400)
> >
> > are available in the git repository at:
> >
> >   https://github.com/shahasit/video-linux-firmware/tree/master
> >
> > for you to fetch changes up to
> > a09b728b77f5e3b335ff85c6c729248e0121f02c:
> >
> >   qcom : updated venus firmware files for v5.4 (2020-10-08 15:07:59
> > +0530)
> >
> > ----------------------------------------------------------------
> > Asit Shah (1):
> >       qcom : updated venus firmware files for v5.4
> >
> >  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
> >  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
> >  qcom/venus-5.4/venus.b02 | Bin 870812 -> 873100 bytes
> >  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
> >  qcom/venus-5.4/venus.mbn | Bin 916924 -> 919212 bytes
> >  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
> >  6 files changed, 0 insertions(+), 0 deletions(-)
> >
> > Regards,
> > Asit

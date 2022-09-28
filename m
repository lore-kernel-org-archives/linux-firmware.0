Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266E0C6FA82
	for <linux-firmware@archiver.kernel.org>; Wed, 28 Sep 2022 11:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB06CC43140; Wed, 28 Sep 2022 11:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F7EC4347C
	for <linux-firmware@kernel.org>; Wed, 28 Sep 2022 11:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664364689;
	bh=oJ0mDRdJkw0cdEnJWN6H3+1bxpfvyi6acXdD3AzZgPw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=B/+5t6DIPxkiGAxvEepPsQg+JuF1GHGxQj7hhyyWvuLakOJjiEXeqQWezEwSjcRCU
	 bO1kTkxCZqOcxSvQ/J4Poqg/GwdR+NjnorV1Twd/I6qHBejRmWLz+VgpBBfvZo1T2L
	 h6RxpqRzooQLzYILmL77z2McvTo8zmvpu3D1V1+X4BvSazUzbRI4xbuOLZipsMZxAV
	 ImUI1yIgecwfbLPx2ww8EWJjRPPPfmZDc5JmWCOfePq0nT1DnF27d8Me8VA56rSAP7
	 uxd3kQutMYmi/9EvvZTuGGP8o+UTDkj9QemVMW/FQX9I5Q335D6agl4fWtu+ZIDBs7
	 doMFlbR5rm6Xw==
Received: by mail-oi1-f179.google.com with SMTP id d64so15006189oia.9
        for <linux-firmware@kernel.org>; Wed, 28 Sep 2022 04:31:29 -0700 (PDT)
X-Gm-Message-State: ACrzQf2nXW0MP25ije8vgzz/YXwke0eT3uQoeFG7TaWq9kSh8uSj29XW
	+oA/ZrrQR5plNsDevVGVMilyYwPDoci/Q1qg/QU=
X-Google-Smtp-Source: AMsMyM60yEcPcl1jDenPHyWETE140UArnphwveATDx2pPnI2VK9P7FTMMgY+6TOT06YDLdSsfgW2HOE6kC/xGdyW9hk=
X-Received: by 2002:a05:6808:f05:b0:350:c7fc:3a71 with SMTP id
 m5-20020a0568080f0500b00350c7fc3a71mr4210374oiw.267.1664364688989; Wed, 28
 Sep 2022 04:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <DM8PR02MB794335113A0327A554F7F3BAF9489@DM8PR02MB7943.namprd02.prod.outlook.com>
 <CA+5PVA7BH+996vpThH5OJpHy_9agpaLxJSc9vqZA5JVV4ATuew@mail.gmail.com> <BN0PR02MB7950C26D723F0468E7FC5F3CF9549@BN0PR02MB7950.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB7950C26D723F0468E7FC5F3CF9549@BN0PR02MB7950.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 28 Sep 2022 07:31:18 -0400
X-Gmail-Original-Message-ID: <CA+5PVA60D2O0br2WCibdscAd8BRuvbw6egiX5FjBsLZkaUJQvQ@mail.gmail.com>
Message-ID: <CA+5PVA60D2O0br2WCibdscAd8BRuvbw6egiX5FjBsLZkaUJQvQ@mail.gmail.com>
Subject: Re: qca: Update firmware files for BT chip WCN3991.
To: "SURAJ ASHOK MAGAR (Temp) (QUIC)" <quic_smagar@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-bluethooth@vger.kernel.org" <linux-bluethooth@vger.kernel.org>, "mka@chromium.org" <mka@chromium.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"Balakrishna Godavarthi (QUIC)" <quic_bgodavar@quicinc.com>, 
	"Sai Teja Aluvala (Temp) (QUIC)" <quic_saluvala@quicinc.com>, 
	"Atul Dhudase (QUIC)" <quic_adhudase@quicinc.com>, 
	"Sampath Nimmala (Temp) (QUIC)" <quic_sampnimm@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

josh

On Wed, Sep 28, 2022 at 1:53 AM SURAJ ASHOK MAGAR (Temp) (QUIC)
<quic_smagar@quicinc.com> wrote:
>
> Yes,
> Please ignore the rest and pull 0e8f546c4c66a61981fd0341ec0a84563d1cfaaa =
.
>
> Regards,
> Suraj Magar
>
> -----Original Message-----
> From: Josh Boyer <jwboyer@kernel.org>
> Sent: Monday, September 26, 2022 7:54 PM
> To: SURAJ ASHOK MAGAR (Temp) (QUIC) <quic_smagar@quicinc.com>
> Cc: linux-firmware@kernel.org; linux-bluethooth@vger.kernel.org; mka@chro=
mium.org; linux-kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org; Bala=
krishna Godavarthi (QUIC) <quic_bgodavar@quicinc.com>; Sai Teja Aluvala (Te=
mp) (QUIC) <quic_saluvala@quicinc.com>; Atul Dhudase (QUIC) <quic_adhudase@=
quicinc.com>; Sampath Nimmala (Temp) (QUIC) <quic_sampnimm@quicinc.com>
> Subject: Re: qca: Update firmware files for BT chip WCN3991.
>
> On Fri, Sep 16, 2022 at 2:54 AM SURAJ ASHOK MAGAR (Temp) (QUIC) <quic_sma=
gar@quicinc.com> wrote:
> >
> > Hello Team,
> >
> >
> >
> > Please include firmware bins for WCN3991.
> >
> >
> >
> > Changes includes updated firmware files with:
> >
> > BQR enhancements
> > LE priority changes
> > Braktooth issue fix
> > RSSI Fix
> >
> > Snapshot of pull request is as below, let me know if anything is missin=
g.
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > The following changes since commit 3593bb7d8f6f18c442a6b0b3f3d43e4d5d7f=
c2be:
> >
> >
> >
> >   Removing crnv32 (2022-09-15 11:09:50 +0530)
> >
> >
> >
> > are available in the Git repository at:
> >
> >
> >
> >   https://github.com/suraj714/Bluetooth-upstream.git main
> >
> >
> >
> > for you to fetch changes up to 0e8f546c4c66a61981fd0341ec0a84563d1cfaaa=
:
> >
> >
> >
> >   qca: Update firmware files for BT chip WCN3991. (2022-09-16 10:44:17
> > +0530)
> >
> >
> >
> > ----------------------------------------------------------------
> >
> > Suraj Magar (1):
> >
> >       qca: Update firmware files for BT chip WCN3991.
> >
> >
> >
> > qca/crbtfw32.tlv | Bin 126036 -> 117664 bytes
> >
> > qca/crnv32.bin   | Bin 0 -> 5407 bytes
> >
> > qca/crnv32u.bin  | Bin 0 -> 5407 bytes
> >
> > 3 files changed, 0 insertions(+), 0 deletions(-)
> >
> > create mode 100644 qca/crnv32.bin
> >
> > create mode 100644 qca/crnv32u.bin
>
> This diff stat looks odd, and there's an additional commit in your branch=
 not mentioned.  Should I just pull 0e8f546c4c66a61981fd0341ec0a84563d1cfaa=
a and ignore the rest?
>
> josh

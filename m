Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43C3C6FA90
	for <linux-firmware@archiver.kernel.org>; Mon, 26 Sep 2022 14:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63D19C43152; Mon, 26 Sep 2022 14:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C028C433C1
	for <linux-firmware@kernel.org>; Mon, 26 Sep 2022 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664202261;
	bh=KIKaen4ftWlvPsVNAVOmR6kNw/m/YraPHJpJOXicITg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MHK98ENM5kcFYy4o4gSVskBy//GuqU0g4KPHaAhGDp9cLhwn2cQqOIZnXuzKOjJ2B
	 1+NWT56IdhxdzpWcuWaCnt8YCWnCr5Lc1tjRFgY3WhkneBgWnxPjwgmyeDKhtVkGXK
	 GYaArPubUeTLZiH7tgj644pEl7yFBYbL8o3377z5Dksnol3P+07IIHn49LbEQt4hCe
	 AGnasNULIvOPvTl3U3Cquf2bP8C6pNASNAGKVQV8F4duPYmBPgMvff9pYnG+McfN/f
	 kPREuk7oxPpEMlMVq3l4XQNUWU42gEiilO/1U8w+G7Vr9vsDAyOVjXb5b5nB0ULs5+
	 /fb+NRGkQTsRg==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-127ba06d03fso9424833fac.3
        for <linux-firmware@kernel.org>; Mon, 26 Sep 2022 07:24:21 -0700 (PDT)
X-Gm-Message-State: ACrzQf2i+8ECzjniV3uhr2ga8f4BGCOfCZZa7qybB3KSubtIsWPCXT/w
	v1tfH9KZPIpw204lYJ+D5txdtq0885lgT4UFEC0=
X-Google-Smtp-Source: AMsMyM6rMC6/oAVkN9UCB3+pO4bSeZVBJWaTvbpr+NwWFMqc6HxwUrKbd9GxgwaGQzMPWOhfQfC3G9iodQyyTQ50kac=
X-Received: by 2002:a05:6870:d0c7:b0:127:9860:95b0 with SMTP id
 k7-20020a056870d0c700b00127986095b0mr12300775oaa.3.1664202260445; Mon, 26 Sep
 2022 07:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <DM8PR02MB794335113A0327A554F7F3BAF9489@DM8PR02MB7943.namprd02.prod.outlook.com>
In-Reply-To: <DM8PR02MB794335113A0327A554F7F3BAF9489@DM8PR02MB7943.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 26 Sep 2022 10:24:09 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7BH+996vpThH5OJpHy_9agpaLxJSc9vqZA5JVV4ATuew@mail.gmail.com>
Message-ID: <CA+5PVA7BH+996vpThH5OJpHy_9agpaLxJSc9vqZA5JVV4ATuew@mail.gmail.com>
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

On Fri, Sep 16, 2022 at 2:54 AM SURAJ ASHOK MAGAR (Temp) (QUIC)
<quic_smagar@quicinc.com> wrote:
>
> Hello Team,
>
>
>
> Please include firmware bins for WCN3991.
>
>
>
> Changes includes updated firmware files with:
>
> BQR enhancements
> LE priority changes
> Braktooth issue fix
> RSSI Fix
>
> Snapshot of pull request is as below, let me know if anything is missing.
>
>
>
>
>
>
>
>
>
> The following changes since commit 3593bb7d8f6f18c442a6b0b3f3d43e4d5d7fc2be:
>
>
>
>   Removing crnv32 (2022-09-15 11:09:50 +0530)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/suraj714/Bluetooth-upstream.git main
>
>
>
> for you to fetch changes up to 0e8f546c4c66a61981fd0341ec0a84563d1cfaaa:
>
>
>
>   qca: Update firmware files for BT chip WCN3991. (2022-09-16 10:44:17 +0530)
>
>
>
> ----------------------------------------------------------------
>
> Suraj Magar (1):
>
>       qca: Update firmware files for BT chip WCN3991.
>
>
>
> qca/crbtfw32.tlv | Bin 126036 -> 117664 bytes
>
> qca/crnv32.bin   | Bin 0 -> 5407 bytes
>
> qca/crnv32u.bin  | Bin 0 -> 5407 bytes
>
> 3 files changed, 0 insertions(+), 0 deletions(-)
>
> create mode 100644 qca/crnv32.bin
>
> create mode 100644 qca/crnv32u.bin

This diff stat looks odd, and there's an additional commit in your
branch not mentioned.  Should I just pull
0e8f546c4c66a61981fd0341ec0a84563d1cfaaa and ignore the rest?

josh

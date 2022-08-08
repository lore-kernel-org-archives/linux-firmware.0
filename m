Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1BFC00140
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Aug 2022 12:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24B0BC4314F; Mon,  8 Aug 2022 12:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE81C4314B
	for <linux-firmware@kernel.org>; Mon,  8 Aug 2022 12:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659962587;
	bh=ZYu+qDCugroUMOoQDZEnDa9h5tpEtdTiro4DSU5wtnY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Sy104VyXJ4iKHViwoljkaaDFjqlNj+u7RUzAA62OvXFiaDBQiIzVOVsIRS9Gm20te
	 cafao0pkcpAP35npe/f9XSQv9N3twR4xEe3rCsLDwQp4FZWJMnhYuwZbKic2fIaPqm
	 D7SnQAPmRwtR1RhagNp1k2cKbtq7BXEren8Xp7SNplDn1TzGBovTZRK8oPRdkC/Hct
	 zMqQHjsr6WMB0EVoW/fvrFkMykaL2FPua3Vyi5ioYKR6rLJmuP6RZ94KxhqbJ75rps
	 2qfBblpTGZP65jxUemzrPrdHJQfH3dtdlaLbcEHZH1XcsxyxG/Ym9c5Cce8BtOCNfw
	 ZQ8SGyQ8H4TfQ==
Received: by mail-io1-f53.google.com with SMTP id q124so6981840iod.3
        for <linux-firmware@kernel.org>; Mon, 08 Aug 2022 05:43:06 -0700 (PDT)
X-Gm-Message-State: ACgBeo26G52wSPNR7VRjkkese27VSBs2LsAvurx+Tge6Izb8i2qaeVbs
	XEelYuxTCKAt7UQF29lYGDCa7L5Ltkw7QpTajII=
X-Google-Smtp-Source: AA6agR6p2bNVjncvDp2TebBIeTB5jKigVmx2oS7WWtom5EqEN8i5sFW/Xzyv8oB3xfGm8LuceYUXTe5XLqxgV9A/pQg=
X-Received: by 2002:a05:6638:3892:b0:342:8aa5:a050 with SMTP id
 b18-20020a056638389200b003428aa5a050mr8695871jav.145.1659962586185; Mon, 08
 Aug 2022 05:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <MN0PR12MB61010F6FCCB0262CAD3BF7CAE29E9@MN0PR12MB6101.namprd12.prod.outlook.com>
In-Reply-To: <MN0PR12MB61010F6FCCB0262CAD3BF7CAE29E9@MN0PR12MB6101.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 8 Aug 2022 08:42:55 -0400
X-Gmail-Original-Message-ID: <CA+5PVA44QkdMYjdYW0VtLpB7CbxfK9ZvkvVsZe_e8bRYOC9pEA@mail.gmail.com>
Message-ID: <CA+5PVA44QkdMYjdYW0VtLpB7CbxfK9ZvkvVsZe_e8bRYOC9pEA@mail.gmail.com>
Subject: Re: Updated Yellow Carp VCN firmware
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"Gopalakrishnan, Veerabadhran (Veera)" <Veerabadhran.Gopalakrishnan@amd.com>, Aaron Ma <aaron.ma@canonical.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Fri, Aug 5, 2022 at 10:26 AM Limonciello, Mario
<Mario.Limonciello@amd.com> wrote:
>
> [AMD Official Use Only - General]
>
>
> Hi,
>
>
>
> Attached is an updated VCN firmware used for Yellow Carp.
>
>
>
> Thanks,

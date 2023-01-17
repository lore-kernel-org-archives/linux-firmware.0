Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AD1C63797
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Jan 2023 13:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8053BC433F2; Tue, 17 Jan 2023 13:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693D6C433D2
	for <linux-firmware@kernel.org>; Tue, 17 Jan 2023 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673960411;
	bh=moJJIx/+EyX9h6vJPbQDwjpI0q+lVtfwFKqHZrg0SLg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=uLrA8Y2Or+bnHS/YWdtfZdaMFL0s5Gt6fUXgb+jbkkRjy80XtVunWH7TwBHEC+i1d
	 ZC1r6VyR3zoiGiZxaK//cdZrZG/b3iFB+rMX4q7yK/lJtNscn02vZlPyWd4bz/oqv/
	 zIsfGx1b8dOQKXaowFPuMPu3EYmaKgklch2mv3q4alwAEg3rBn0bEr7iCavrxEoBca
	 8j/Wc+RVfHTFVqyo9VCHkCIt8Bkf9ZmbKZqZOAgm4qSVNLWwh7R4lHJC/4mcht/2wi
	 ExwkGVJlq/evTyvHdBD1vvB0SurfE/kv5pwazVL30jPidKMIjOQ3rdJEAaSpOUckKW
	 jwQaehlpb2LSQ==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-4d59d518505so251668307b3.1
        for <linux-firmware@kernel.org>; Tue, 17 Jan 2023 05:00:11 -0800 (PST)
X-Gm-Message-State: AFqh2kptXItfQhTWD8szm8WLwOGU2FfZPaAQt1OsRX6I22igNWzVW6DP
	HvfzzhdGkmmQkMTqlcWL4ChYmAQzj0P1mLpylk0=
X-Google-Smtp-Source: AMrXdXtnpZ9AECFIORGlvzKV3CymcPRrW9WW87JdTb4kem0+Z/ToYqYSwdjnQIjE516b80fVwIDl+vfpyqCxYUQJ2+M=
X-Received: by 2002:a81:1c0a:0:b0:4b0:84a1:3a9d with SMTP id
 c10-20020a811c0a000000b004b084a13a9dmr358721ywc.66.1673960410413; Tue, 17 Jan
 2023 05:00:10 -0800 (PST)
MIME-Version: 1.0
References: <DM5PR02MB3686017F1E5D47CDE88F9BE2ED649@DM5PR02MB3686.namprd02.prod.outlook.com>
 <DM5PR02MB3686865C387271B9EA8143D8ED689@DM5PR02MB3686.namprd02.prod.outlook.com>
 <CA+5PVA4O+xVuGC1phdRjZvM_AekeCYatMZCnYBMASZs+BrbtqA@mail.gmail.com> <DM5PR02MB36861D08E417E20C3540634AEDC69@DM5PR02MB3686.namprd02.prod.outlook.com>
In-Reply-To: <DM5PR02MB36861D08E417E20C3540634AEDC69@DM5PR02MB3686.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 17 Jan 2023 07:59:59 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5mfnxOqGyE3RCxQk+kvS=Ma7ZDzmU-JsnQtk-SBnmNjA@mail.gmail.com>
Message-ID: <CA+5PVA5mfnxOqGyE3RCxQk+kvS=Ma7ZDzmU-JsnQtk-SBnmNjA@mail.gmail.com>
Subject: Re: btqca firmware 20230117
To: "Tim Jiang (QUIC)" <quic_tjiang@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, Ankie Wan <alwan@qti.qualcomm.com>, 
	Hailong Ouyang <hailongo@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 17, 2023 at 1:18 AM Tim Jiang (QUIC)
<quic_tjiang@quicinc.com> wrote:
>
>  Hi linux-firmware maintainers,
>
>
>
>  Here's a pull request for btqca bluetooth driver. Please let me know if you have any problems.
>
>
>
>  The following changes since commit
>
>  a1ad1d5b50626f2d126adf1964ce0e98cbb8b39d:
>
>     amdgpu: add VCN4.0.4 firmware from amd-5.4
>
>
>  are available in the Git repository at:
>
> https://github.com/tjiang1234/btfw
>
> for you to fetch changes up to 2ba1beaae0c649ce8a50baecc8df9e81cd524e65:
>
>      QCA: Add Bluetooth firmware for QCA2066

Pulled and pushed out.

josh

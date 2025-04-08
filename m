Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E53C369A2
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Apr 2025 11:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3782C4CEE7; Tue,  8 Apr 2025 11:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78AAC4AF09
	for <linux-firmware@kernel.org>; Tue,  8 Apr 2025 11:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744113592;
	bh=H0vOKOnvIMK8uHZEdYUjnnvl9zVyfDRLRpKvB9VcWUc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=PF7uDluoHngpXf09XaFC1A1MjnZv+1N/4U5Qcdspb75zWcbDJcbMg7yRcQLq+ijJ5
	 1ht210bUWVimuZzhi65HHE9vH1w5sGI2B1Tc1b1UYhCdJB3d0Dpdp8AndlqgRcOJWt
	 HFWFDi6mOP+s/Dzodp6HDSSlpV7VTV2c8b34pNncrGfLhkKeCf07RX8tMdFII5c+Aq
	 U5QxYILJgYbcfwicg8KYZa1bD99oE3dMcPR2VfRbmqNJOgUWUjE1nceJeBSxlIVKJY
	 1z6sjydsiFzVdVnOLmVZTLr7GrGkc4jbBNpZZsEyMY6BEenIxUZANN/iRMrdqdSIsO
	 pzoThiMeZWkPw==
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e6e1cd3f451so3612496276.2
        for <linux-firmware@kernel.org>; Tue, 08 Apr 2025 04:59:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXRmPTo+ecCH3pir94xsQFK7fuxnNT2cVtQlC3cMK/8dd50V5s1lHnmegV1TcoRsA5TrlIhIeNXAfEsuF4ggg==@kernel.org
X-Gm-Message-State: AOJu0Yxvdln9wm/YIm3GLhbwr6WXJaddAKjqo6MBKulp6kl+C4zwdyBg
	3rZeoH2Uexbqt/qKIemhTGXWD7tzJ2nSKbdkuWOcTWdN+mv5baj9ApWpVovK6nxpbD1e+DEHC+r
	VENXRRn56F0IUhXd9mdMVdX3GfCg=
X-Google-Smtp-Source: AGHT+IG7qwUWvEA+GdvFO6T+df0Sxk02zDtlVMFQGX0ZnBGblxQfQPbhk9t44hob9xwjDstuWENM8i+DyMg+oWmLSUo=
X-Received: by 2002:a05:6902:13ce:b0:e6d:fe4e:2fea with SMTP id
 3f1490d57ef6-e6e1f9c3caemr24488976276.22.1744113591854; Tue, 08 Apr 2025
 04:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <882c9f31-96a2-4057-aab1-5d39df3f20b7@quicinc.com> <r5wix6wmi5mw43cyzwb3j36az66nih2bwurkikgwgw33kltg3p@b7hyrp3kqyg4>
In-Reply-To: <r5wix6wmi5mw43cyzwb3j36az66nih2bwurkikgwgw33kltg3p@b7hyrp3kqyg4>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 8 Apr 2025 07:59:40 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7=qvpoY1VsxbReiLjKYhFd3xysmC51VvVujWQ2MkZtiQ@mail.gmail.com>
X-Gm-Features: ATxdqUEAedVHMhTKHmJqqozEv80RrFJIPdCJ6gvuK7c8jZWI6lxxzZc_vePP2h0
Message-ID: <CA+5PVA7=qvpoY1VsxbReiLjKYhFd3xysmC51VvVujWQ2MkZtiQ@mail.gmail.com>
Subject: Re: [GIT PULL] QCA: Add and update Bluetooth firmwares for WCN785x
 with USB interface
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Zijun Hu <quic_zijuhu@quicinc.com>, linux-firmware@kernel.org, 
	agurenko@protonmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 7:43=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Apr 03, 2025 at 05:41:11PM +0800, Zijun Hu wrote:
> > Hi linux-firmware maintainers
> >
> > Here's a pull request for btqca bluetooth driver. Please let me know if
> > you have any problems.
> >
> > The following changes since commit 41a528251649772edbcb705a40e617fd1485=
8e53:
> >
> >   Merge branch 'intel/guc_70402' into 'main' (2025-03-04 19:09:49 +0000=
)
> >
> > are available in the git repository at:
> >
> >   https://github.com/zijun-hu/qca_btfw hmt_usb_x86_0403
> >
> > for you to fetch changes up to b12240420adec3089fa0bb5a09eaa0cefbd8ce76=
:
> >
> >   QCA: Add 8 bluetooth nvm files for WCN785x btusb (2025-04-03 17:18:24
> > +0800)
>
>
> Josh, it seems this pull request got ingored / skipped by the robot.
> Could you please take a look?

Thank you for the heads up.  There was a merge conflict in WHENCE that
I manually fixed up.  New MR here:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/510

josh

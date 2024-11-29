Return-Path: <SRS0=038F=SY=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EED7D6EC15
	for <linux-firmware@archiver.kernel.org>; Fri, 29 Nov 2024 14:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0438AC4CED8; Fri, 29 Nov 2024 14:35:52 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 026A3C4CECF
	for <linux-firmware@kernel.org>; Fri, 29 Nov 2024 14:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 026A3C4CECF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53df80eeeedso1906576e87.2
        for <linux-firmware@kernel.org>; Fri, 29 Nov 2024 06:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732890949; x=1733495749; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nw9bGbYR7ywJM7+QLiwGJZn9TRw0SySFZKLZYZ7Xjy4=;
        b=mLbKm+Ki86ZOxt9oG7EnXDgHw5wi6wjrIGvK+r3L4M/bUEl99i4N7fBdQ5PEarOQS1
         w3dfO4LDmSSNQYwqlRoFSibwJZNkbZK20aea02HUJ+LcBr6Kb8ceJ8438mdKMaZ1sK5S
         Bxgn67wl1vGxofkK6Fu9qtkx97eucEJBEGj2+6+o+R4sdC30n5XrjT9s34G9T+tmmk7g
         WNTqL6QP6Z8YN5qq/nIPc8NLyu+anfAus5dmF31LTtWxsjiLPBR20a2Y7IZBeQKjai3f
         /W2c878ByhorUUxp77LAoDugiaOwTEElibiTMH0IafiqdTo8QJI2cHv/pt3N4A2R/Jby
         p7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732890949; x=1733495749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nw9bGbYR7ywJM7+QLiwGJZn9TRw0SySFZKLZYZ7Xjy4=;
        b=BnEajlwycWJ8FnX74BMDI4Uajn9r2yF7LHPVk82Aj38OFPLq6mAse3i1brm6gm+e0S
         hwcOW/8WiZzOigZbxvhp1dOdRhCVAuKC+N2IjAalTMN4FV1zT9HiH5EFEB13tmKxSROm
         5sxz3Une+u6rVP/K16nEMEejgN6cOAJTUE1EnwmtviNmpyyhb1ggpEEDLlQJIt9AnaEX
         cYZQPmHX9JKl/nOEkAZm3U24dy/xFFwHcdog0TcHxyHb0n1SZPsY+wUvsvEsh+NC+E6G
         D4ibzsqvoPXUSUMW8450eIj4of4nrH3dDTSP13VwTsxIB9wImKtCs3/9GdoNDY2DU8/d
         Qq6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9dutHyv+bMHleQpIXTT4Y9jWqgDmxsf9NQ6b7bs8+ZS0guC6sTpkSJHieeL0F6ozksvuEi/Qn1/kS7xxjdQ==@kernel.org
X-Gm-Message-State: AOJu0YwDzmT8VYqi8H4e5OS3NphhFj2JHmb5rdTpqxn9flLpTlgGoI5o
	j75Z2+8pX5+sihDuMz2ZVy3HKFwWixKXbCJkMkBfjjLBXzhIAoKn84SeJQE5pOQtuM3yzRJjDmc
	y
X-Gm-Gg: ASbGncv37FJy0rsjRq2xYEaTfZXI9oAApw9xE7OUNBCGHX5h2P+FDePOL2LjDaQ3/Lt
	8squhdg1SX/59UvO6sMPnAdl8tJvLEI6GpF8OtBpgW8Rm1JMHPL4zvR/vK5/lq5HE8G+a/BoctV
	mTB/AP0IL/HaQ7aaIft8izQsEcRT5PXIXlfTyRA7nFRrYIfByXQDkYVE89BK28pUP+6Imzch4fN
	XETw4Z7AOvIT0QeI7qP9n5kORYZ5ML/lkY6Boxl3Q5vhFWK3Y4fYhuoBmdXKqxx7mKFDFNDSeTB
	T4dBLx4vFtL2EIjs/W4mP4LNdR8ldg==
X-Google-Smtp-Source: AGHT+IE90QA2sTXGE7j5GHpkF7qty+qWC7fK8rfj51Ie6NL//0MeGeC2BHWUKfGUChva2DyOh+dKyQ==
X-Received: by 2002:a05:6512:2391:b0:53d:eec6:4622 with SMTP id 2adb3069b0e04-53df0112169mr7638601e87.48.1732890949187;
        Fri, 29 Nov 2024 06:35:49 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6496864sm499591e87.217.2024.11.29.06.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 06:35:48 -0800 (PST)
Date: Fri, 29 Nov 2024 16:35:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, 
	"Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.com>, 
	linux-arm-msm@vger.kernel.org
Subject: Re: add venus firmware file for qcs615
Message-ID: <rukxa3h72trvqvu6wkxmkp33entybcvxfjlpcjh7odipwds6lq@rt6ferue5nbr>
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com>
 <ng4o7sdejoh4jn4nnarjd4lio4lbx2tiuiz5c6bigjbtxldinr@xl5wx6dmdivy>
 <ab4f83c1-5cd6-a80b-fd85-ccc337c8f301@quicinc.com>
 <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
 <a1bbc1d0-d3bd-e44e-e393-a7ade909a506@quicinc.com>
 <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>
 <egdqhgdiqqny57yiauiyekcvhxvebfttyncqoazslzjprwvakz@txvy7wn4vg7g>
 <a259c98c-6c77-1c1e-e428-41c2550f7517@quicinc.com>
 <pukoimsqhck5oymirmgiwad6s3l6frt7xbahp7juhvj3rt4622@wpajx6vyw5nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pukoimsqhck5oymirmgiwad6s3l6frt7xbahp7juhvj3rt4622@wpajx6vyw5nl>

On Wed, Nov 20, 2024 at 01:22:50PM +0200, Dmitry Baryshkov wrote:
> On Wed, Nov 20, 2024 at 04:40:51PM +0530, Vikash Garodia wrote:
> > 
> > On 11/20/2024 4:09 PM, Dmitry Baryshkov wrote:
> > > On Thu, Nov 14, 2024 at 01:31:14PM +0200, Dmitry Baryshkov wrote:
> > >> On Thu, 14 Nov 2024 at 13:05, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
> > >>>
> > >>>
> > >>> On 11/14/2024 4:16 PM, Dmitry Baryshkov wrote:
> > >>>> On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
> > >>>>>
> > >>>>> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
> > >>>>>> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
> > >>>>>>> Hello
> > >>>>>>>
> > >>>>>>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> > >>>>>>>
> > >>>>>>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> > >>>>>>>
> > >>>>>>> are available in the Git repository at:
> > >>>>>>>
> > >>>>>>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
> > >>>>>>>
> > >>>>>>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
> > >>>>>>>
> > >>>>>>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
> > >>>>>>>
> > >>>>>>> ----------------------------------------------------------------
> > >>>>>>> Renjiang Han (1):
> > >>>>>>>       qcom: venus-5.4: add venus firmware file for qcs615
> > >>>>>>>
> > >>>>>>> WHENCE                      |   1 +
> > >>>>>>
> > >>>>>> Could you please be more specific, what is the difference between the
> > >>>>>> existing file and a new file? According to the soc_vers the new file
> > >>>>>> supports sdm845. Should it instead replace the old firmware?
> > >>>>> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
> > >>>>> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).
> > >>>>
> > >>>> Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
> > >>>> use v5 signatures?
> > >>> Infact we started with loading sc7180 firmware on qc615, video init failed. So
> > >>> far i have seen 2 categories in signing version for video bins, either default
> > >>> or v6 specific tool.
> > >>
> > >> Can firmware / security engineers actually advice us on using v5
> > >> firmware signatures with QCS615 _and_ with older platforms?
> > >> Existing venus-5.4/venus.mbn uses v3
> > > 
> > > Vikash, any updates on this topic? Would it be possible to have a single
> > > FW image with just v5 signatures?
> > Not yet Dmitry. Having a followup with relevant folks this friday to understand
> > the signing requirements across different SOCs, hopefully will be able to add
> > something on this by then.

It's been more than a week since the last email. Are there any updates?
I'd really like to get this sorted out before next linux-firmware
release, otherwise we'll be stuck with these names for the foreseeable
future.

-- 
With best wishes
Dmitry

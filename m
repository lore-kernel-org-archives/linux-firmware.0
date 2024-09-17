Return-Path: <SRS0=5j3L=QP=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041A1C3601A
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Sep 2024 14:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3B45C4CECD; Tue, 17 Sep 2024 14:13:27 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 923C8C4CEC5
	for <linux-firmware@kernel.org>; Tue, 17 Sep 2024 14:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 923C8C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f761461150so61311561fa.0
        for <linux-firmware@kernel.org>; Tue, 17 Sep 2024 07:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726582405; x=1727187205; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=20CNLvOyUUOXoU+FkRSTMZDwqqaWT7yX2cgwiXTVbpo=;
        b=usliAyZKvTNu0Svd3dzRs4q4c09VTsjCh8TgtqwRP5a8G/CTLJnZnSNaubqnmJWfoW
         9Wy9HooT9YY3Maqf2D+bvMU62Tl+ThCzSFnSWbkO4kdvhOxWL7Sq4GbnO7qIQGKP/RON
         U0QVYgojkZpJdUqKe24LtajEJuyoP+upjDgVNjxSy2jbhH5ib6YPdtbbABIUPT24zOzH
         P7ssQG/ElanpLGd7bRv9N4WHP+xZDgnyaFd/w74LfBjJUxF43Y0ZaHMroTcXs/F2vcza
         vkCWsjDKzz6xmG0e/fWrSy4q+/tWlsSf4pXwh19xfi69VDJRyIkoxwRroCbkpwLLbRZP
         r0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726582405; x=1727187205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20CNLvOyUUOXoU+FkRSTMZDwqqaWT7yX2cgwiXTVbpo=;
        b=WEqL+k72mzeD0EKiOO7RTvV8FhfOrHcpuW/YGQ37k1gLWP8jkUVZ9Os0V73MT8MwMN
         5nahqj5fXeIWyasrg7EkanGCh2Obt/ZpW1eFi7lYXRT6uKB4G794aQz+9LqIhwLGhLre
         yIlR5p2suFT10mc3fAIZeSR/iDxA8wSGTs4a3VSjfwjezUd6xFS/mpL/+3DEjhYhDPhi
         IGQZWZ/qu/PxoC7Aqjku7StNSk7EJj159gUmD9SRaAU5Jb9GPz9dSeVGwFmUo6Mip+33
         uTmMiTxFukE+tK/1TxOdB9QfmF12FFioVei4Db55crnDpYyqQUm3c7/iX26tH49hU7Pf
         zyRA==
X-Gm-Message-State: AOJu0YxdoKm/AB3bQFv2Opg8cnAvb/Slk4aAc1kRl1K2IkDyDuyKrCzT
	EVqrJqrzy++SirWL0KLi7LA0D5agl7tQV8xWs16LcljPl7I1xFN9ojGhdFNx8/0=
X-Google-Smtp-Source: AGHT+IF3ANdFFNjkMP69lAqM1H3KxfGPX7iDKp4IsjBTwV6kB1b0WX/YZIbOF6JWiiZdNrPjBu7EVw==
X-Received: by 2002:a05:6512:a8e:b0:52c:e17c:cd7b with SMTP id 2adb3069b0e04-5367fed250bmr10763816e87.22.1726582404391;
        Tue, 17 Sep 2024 07:13:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870966basm1204640e87.138.2024.09.17.07.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 07:13:23 -0700 (PDT)
Date: Tue, 17 Sep 2024 17:13:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, quic_rajeshk@quicinc.com
Subject: Re: your mail
Message-ID: <gmss4xrecjq4pyuoggpoa35suetarsmcx5vfl3nc75ous2hhbl@zej5qjjkd2oz>
References: <20240917071016.gp43cuysm4kdznzx@hu-akhilpo-hyd.qualcomm.com>
 <CAA8EJpp4tGH_v7z9Um7Y+xxWPyFFMq4P3-cytNSJe3dqhLD_OA@mail.gmail.com>
 <20240917080326.vpks3w3dmhgn5aiq@hu-akhilpo-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917080326.vpks3w3dmhgn5aiq@hu-akhilpo-hyd.qualcomm.com>

On Tue, Sep 17, 2024 at 01:33:26PM GMT, Akhil P Oommen wrote:
> On Tue, Sep 17, 2024 at 09:24:19AM +0200, Dmitry Baryshkov wrote:
> > On Tue, 17 Sept 2024 at 09:10, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> > >
> > > The following changes since commit 6c88d9b8253b8ec6df701a551a56438ea2e5bacf:
> > >
> > >   Merge branch 'amd-staging' into 'main' (2024-09-13 20:28:50 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-SA8775p
> > >
> > > for you to fetch changes up to 43c971bcd74d9793140a8fbbcc805204cb797f96:
> > >
> > >   qcom: add gpu firmwares for sa8775p chipset (2024-09-17 11:57:51 +0530)
> > >
> > > ----------------------------------------------------------------
> > > Akhil P Oommen (1):
> > >       qcom: add gpu firmwares for sa8775p chipset
> > >
> > >  WHENCE                    |   2 ++
> > >  qcom/a663_gmu.bin         | Bin 0 -> 55892 bytes
> > >  qcom/sa8775p/a663_zap.mbn | Bin 0 -> 1054680 bytes
> > >  3 files changed, 2 insertions(+)
> > >  create mode 100644 qcom/a663_gmu.bin
> > >  create mode 100644 qcom/sa8775p/a663_zap.mbn
> > 
> > Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Sent it out sooner without a subject due to a 'Mutt' fiasco. Please excuse
> me for the missing subject.
> 
> Hope this is sufficient to pull the firmwares.

I think the pull request didn't hit the mailing list. At least I don't
see it in the archives on lore.

-- 
With best wishes
Dmitry

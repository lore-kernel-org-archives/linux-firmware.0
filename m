Return-Path: <SRS0=/mxS=DE=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B83CD3427
	for <linux-firmware@archiver.kernel.org>; Thu,  7 May 2026 11:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BBC39C2BCB2; Thu,  7 May 2026 11:22:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC240C2BCB8
	for <linux-firmware@kernel.org>; Thu,  7 May 2026 11:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EC240C2BCB8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64790tUk258726
	for <linux-firmware@kernel.org>; Thu, 7 May 2026 11:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fo9XydOcHJ80jEDSvGOMPB4sx1vBdCwRS1ijKyB9oUs=; b=URR8d2blSwSfUFYR
	zFb5Xdm0N7Hl1wTlq9BLyiBjT/qbPNL8vDJEPtb39yUtUq4Nyaag27ZxCDS0F7Q7
	ktcycNQBz5WkVbTu/epblDCzMEw1/6pOtn0N7DaAQj68plIVn8IPjUYxRVycFG3I
	x1CzdDPHcKR83DFgBm3mhjdJhJS8tu5KUzUHw07Khy1VTswUJJjljGMWTtd4ZHwg
	+QKuP0yO0TVgGhN9nwlZXLotBS9jSLQ2NHqv/H4Jj8yBMOIbYZOUarvROgIR0NPd
	WogkQx+/vQe3I827NcoXdkzC4pMyYfAvppJrmRGnKtqHddF0/tNxRkyQZQYyPnt+
	zfXtUA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hr8svsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 07 May 2026 11:22:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e67a4f642so15587161cf.0
        for <linux-firmware@kernel.org>; Thu, 07 May 2026 04:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778152922; x=1778757722; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fo9XydOcHJ80jEDSvGOMPB4sx1vBdCwRS1ijKyB9oUs=;
        b=jh3UPNm+yTXUr/JJouXaq905Ps1UiBs8w7iwVyy3pJETlZViFArxllXfFY92OCfJIf
         eFBGQfb9q7ublZ7hEHlpRUraFa4JV/J7oiuQk7r2l0reki2X0DAnRKOQ87v29WSBL81z
         JQNGsH63CwznCyEuxGsbPNQKOa+zmaQey4kjwTUD2aXbfbAN2h2idz9ishbjqfGh7Igr
         Q68xNjtlYQdSNszQaYS/LWqkc0Yfxxe0CxBFCVyzh1YYTnfYAj/itBPuL16EpU0a+aYX
         QfWwWjXo2FNbXKjXJOOns9DODGj90g+D5G22kwcwZMPW/XySiokNCMcpGqhfcHbPiyGY
         +/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778152922; x=1778757722;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fo9XydOcHJ80jEDSvGOMPB4sx1vBdCwRS1ijKyB9oUs=;
        b=kz/naYKJ4wwBdoWNncow7GpOKgai/Bu0Xu282ZWsa6ORTMxmRzbhvSQBO1u40ovdbs
         ktF4JTxNf84/VIwWqbf3TXEqjkufCXXeNpacylx5p4L/ey2PexNAa042aSzoWtnAlZ7O
         EKodynURMqVcxNDlukQ5/wJza8YvVfHSDwmY+CEfQewyveBJg5Fqm4C0+bjxB+WoFj8s
         s3fvqp9jLgwObz1mNOzPwfOrd3D2xP+pBtC8cCvw3GaEum5BaWSbmJcaKgzCU6HwwA7Z
         EHnnLjIW9lcrymoJHA6q9ajJGGzf5LaTxrI35IfdYtlraqjrPoz5Tm0Irn6TGY9R8I/v
         ItpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SLtnqtksri/psj6pjq42dAyK2cHh4Im1weWQuBOcDahCMbmVghO/LLHIPVVMr8ikmqUjrV9AL7ZySTW6OVA==@kernel.org
X-Gm-Message-State: AOJu0Yy1TY4YWa+D8UYZ99m1rJc/QMOLplazRco2tLz0LjKvim6fHtKy
	FCz0rTEsZ0uq5Xk9CxVtRvWscuQ43dlmdDPsEYXpm8UpeNgukN/rntjgooViwJ6TP0jtTfn1oet
	lNeSb2kQe3O2LYUKKMKZQo+fzBSx7CZCYeUAC2P82mVGKnVB4gBm2ffuBMf5q8Ww=
X-Gm-Gg: AeBDievphHaOWQYS+YXE05UsDgF4lrr+SWGL64WECIQvZPxkUX0pszjAqT3b4Nsgovu
	EmOiy2oEyPZgwW6m6cF1Yi+RFjZJo5HIJ6rz1dEordvgdzqkkmX+ByfXcOVAfvDI3P1gwmyRX4p
	ApbtjmA5RrXauIjETN3388zGoediIN0DU0L86NZ8Oy1c405KnmFBMzUheGuH8tz7BxyhqPrnZb7
	JLMQmYpodIBbufYfQPH88ddm87LoYsik6tyNcee2ywZw8HUSJMSSLXYHfruzVI2d68yNGrjUtb6
	OO6Cko/k3vSj+qXehVbJs63OR4EgcE8dDKjb6Ktys0KLQL7oFMOfEu6c1b2i5WWZDxFguHmKZIP
	QmUbDrjREpwLdgwj42LDZEPCBHwGPJQAkXM7EMnDv/wQuQYQguVl2I5a4fz6kKpgUr/F2/kKk8v
	zHiw/+sDPFAX7VBt2lpyicxkNkdVERG6+vteBYSdd6NHZjTA==
X-Received: by 2002:a05:622a:1105:b0:50f:c625:4dc2 with SMTP id d75a77b69052e-51461f9ee04mr99576351cf.35.1778152922005;
        Thu, 07 May 2026 04:22:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1105:b0:50f:c625:4dc2 with SMTP id d75a77b69052e-51461f9ee04mr99575831cf.35.1778152921478;
        Thu, 07 May 2026 04:22:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39380eca9aesm44533811fa.30.2026.05.07.04.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:22:00 -0700 (PDT)
Date: Thu, 7 May 2026 14:21:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: syyang@lontium.com, linux-firmware@kernel.org,
        xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com,
        rlyu@lontium.com, xbpeng@lontium.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] linux-firmware: Add firmware for Lontium LT9611C
Message-ID: <sgxdjvn45w32mz3hmbpgahvz472zmqrvd3souzu5yl2n3q3tsa@l6qbuxdsqxz3>
References: <20260506104934.82275-1-syyang@lontium.com>
 <CAO9ioeVBF2O9sRT+KzMETvYuV5Jw0okj6MiM1sxVdc5j8Pdk3w@mail.gmail.com>
 <CAFQXuNbA-wW-ZyqZKjRagA+qpPMP7AAtaX67Y4=AHOx23s2SEg@mail.gmail.com>
 <CAFQXuNbWQQN0U+s0K2XV7hy6ow3x7RAB8Q=nxOvsWENDAE=2VQ@mail.gmail.com>
 <uprzduq4ct2dpkwvlbwxw43b77yzubjwkzvjhadlkoajmbbybe@3cygq6vamfy4>
 <CAFQXuNZpBnA=kCCKEhXtN4wDOdU48D94PpbYrR_cEu+YUt8aBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFQXuNZpBnA=kCCKEhXtN4wDOdU48D94PpbYrR_cEu+YUt8aBw@mail.gmail.com>
X-Proofpoint-ORIG-GUID: -nSYUUfA3rOkLvihJ911Ix03kloMmWcL
X-Authority-Analysis: v=2.4 cv=caHiaHDM c=1 sm=1 tr=0 ts=69fc75db cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=Kz8-B0t5AAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=CUJi3jauEGqHWIC8MBIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: -nSYUUfA3rOkLvihJ911Ix03kloMmWcL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDExMyBTYWx0ZWRfX+z9kCQD80B87
 AsY75ECItYsTskeIklwhYLDlg+ykH3YVO1L4gFAERli8rbF6Ddj/mtu9jZMIVG5usZWWKE+bevX
 CflrqCDUEHcDK0YRR6tLA7nByHIfeUdW4ZP2Gzke/bzWIKLachHxUsPsx4Ath9uoLGQcLnWG+eA
 BPcHdkuMD1lCIWg/4TNq7nnPp/a2+i6eTHTIgTdw3NNkwGy0IJM9rExh3oPsmXylHuVcIwhYPJm
 7InpZIhBC47hpMz1JyMf7X+iRok4INqhbZYT0bHn8CWugd50Z2o0vwlr6p0AYylGVTdC/eV75Dk
 ElA74TIuvKidztnfGfNgJw1ox8TdoFYW0qzWdBRetUaOjOI+r4GINI4HMI8WSdf14lU7SNwaLWc
 bMTgeavx52Xkzp979ifSVFlW9l18+rn4gEvBVhOarHnbud65svDUxbRzqKplagstwn3Br2/PCR2
 /iNaJmqS/DqDr8+0X4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070113

On Thu, May 07, 2026 at 08:56:35AM +0800, 杨孙运 wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年5月7日周四 04:08写道：
> >
> > On Wed, May 06, 2026 at 08:01:46PM +0800, 杨孙运 wrote:
> > > 杨孙运 <yangsunyun1993@gmail.com> 于2026年5月6日周三 19:55写道：
> > > >
> > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年5月6日周三 19:46写道：
> > > > >
> > > > > On Wed, 6 May 2026 at 13:49, <syyang@lontium.com> wrote:
> > > > > >
> > > > > > From: Sunyun Yang <syyang@lontium.com>
> > > > > >
> > > > > > This is the firmware for the Lontium LT9611C,
> > > > > > which implements the function of converting MIPI DSI to HDMI.
> > > > > >
> > > > > > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > > > > > ---
> > > > > > Change in v2:
> > > > > > - WHENCE
> > > > > >  1. Modify lt9611c_fw.bin to Lontium/lt9611c_fw.bin in the WHENCE file.
> > > > > > - Link to v1: https://lore.kernel.org/all/20260506100242.79276-1-syyang@lontium.com/
> > > > >
> > > > > Why? The rest of the Lontium firmware is in the root directory. The
> > > > > driver also (IIRC) expects the firmware in the root firmware
> > > > > directory.
> > > > >
> > > >
> > > > Our intention is to place all Lontium firmware in the Lontium/
> > > > directory for the following reasons:
> > > >
> > > > 1. To distinguish them from other companies' firmware files，such as
> > > > rockchip, qcom.
> > > >
> > > > 2. To keep the root directory cleaner and more organized.
> > > >
> > > 3. Clear organizational structure
> > > 4. Avoid root directory bloat
> > > 5. Improve readability
> > >
> > > That's what I think.
> >
> > It's all fine... If it was consistent with the driver that is being sent
> > to dri-devel@. I'm fine either way (and yes, having Lontium subdir makes
> > sense as this is the 3rd one already). But then at least drop a note to
> > the dri-devel mailing list that you'll send the next iteration of the
> > driver.
> >
> thanks Dmitry, your reply is very useful to me.
> 
> In the next version of the driver (v5), I will use  #define FW_FILE
> "Lontium/lt9611c_fw.bin".

Thanks, the firmware is merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1034

> 
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

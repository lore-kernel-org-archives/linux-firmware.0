Return-Path: <SRS0=qm9z=53=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22566CF258E
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Nov 2025 07:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD4B2C116D0; Wed, 19 Nov 2025 07:24:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C777EC4CEF5
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 07:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C777EC4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ1c8vM3412652
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 07:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vx8RsqC6QNB3pIM4PEr/KVM/Je7tNW6fauvybuJjIYk=; b=j/poQu20YZrAN9uk
	d5hYkiQfQVga9dNKm0z31xApP5V77Yg//xbkZaJzut3P6fw0oDki8GloSCKScIYo
	R/st55e9TFxElU4vZmsqasBE+3MfWro0+wNSSQSTLan5uNueFIe+np26ZNbHkSAM
	98ezHjVLNlv4mCcY1LTIKwdSFt/F3ylUYzbYNMAP4W/6X7B/B8b+Z6VPtBz1wEjW
	YNhZjuztHWwNwyn+JDOiMgWFbYkQW5+Y1EYNToTyMfOlxpQw5GmhdEY5XgIH5ihv
	4V017yt8+ClfYBmROird/f5prqlk+Y8MRN3o2H9mi59kfRranFMwH++yrSoYbVsw
	3FKd6g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agv0v2caa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 07:24:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed74e6c468so87112531cf.3
        for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 23:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763537050; x=1764141850; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vx8RsqC6QNB3pIM4PEr/KVM/Je7tNW6fauvybuJjIYk=;
        b=L78j29J0qhDpVc1UVGy/o9f/NCjc+DMBxBta3tVmCejE6/E+Wj1iMnokwcWMpFgmfW
         zwIM9i/5Z4JG66nWoExcEdnXR7fZQUaePLBx3QCLWtYHScRgIcezGXoMJCTr94VcFv/Y
         j+Iq4rVUJaKLi48BOJhn0E3RRbJDQ63fUvRFodf0iSxmF7oO7Tewmu7Qk6qYUKcyTpmK
         AwjemnfgpqQBgJmCx63CMOfJ8kwc2B+NZX/ClNFBygf3ZjjmyiCptzusSwnZ+e5JGZ1Q
         juLTaAjFuA3bunxrOi90JKj3slZGQo2C1PGOOW9Yy72gZSvU5VBtjTHUJNU2j/CR0eyo
         UjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763537050; x=1764141850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vx8RsqC6QNB3pIM4PEr/KVM/Je7tNW6fauvybuJjIYk=;
        b=kL4vBIjlomUioxUMdakacXmkEVIHgxXJyTf4KRkhOtvftm6YRxOU8omjMDElv8Vhgb
         3ACCDTAf/HjE9OPjiMWpdB4r/CmFUsrHCXzcWBj8sJpNSuEEM4JRPoaC3HhE/J7W60uX
         Fwbd2kyQS4CvYXy9evnmXWUQbaGPQjdsaFHONTEMdDn1GSgEjLEn1aNGNO6TDHJm/swe
         QmCPpHT+6hgGPoEcNBEpPxYJnmrobaX2uj5yImSUh/4sM6YSTQAuDOpvLqlw066XaGtI
         H66138lQcApyiNt+6TXazLeiwDrO0N+trUltxp9ByP6CD38oSLLirO3R6wwHjqKrjCrN
         uerA==
X-Gm-Message-State: AOJu0YxfaHQa7goYShYZw4D+JCczKz26t7hcBN4O6EdMFMSFF/oulaX3
	3rfp9qe87pjRcVxVb4n21x/+sFR8VKyWBENbeDs8xy4h96CpNjn0uzdQfwuFHQW3ObA3uPCwkct
	rYFydOWnak59KDz34KMB9ueuuEdr5JM5EEJDyLDy+Q9B1z6e9QdR3Q8VFPeU6L/g=
X-Gm-Gg: ASbGnctzo/GfgFxMNoMus8qB4dpuZI6OTJmCoscZ/3bNjcB89Jd78kMggCcyaLqK5R7
	2PnCX6e4Hsit2YV1r2rRGk73z34PULOMo7Ciz9foCQyxCzS+G+RS/fpPJ0kqvENzzw3N+muELYy
	SGTrKFDb8aZYXfxVJ5emge7yQpTqXXgr6SyPZsTvLfVa7yGDNdhGw+EeBxJIOHHklz8hGhSAa7M
	2Hdeg5cg5LTsaN1FfGjjWKhaav+KYB6/tZ6fdC9X/u4Shn9bIbJwtM2PGVb090en/Oj0BYremWj
	CJcWFIvUN4ZkFRK6yOf7hnuvncf4SRMLKEmtmPs7gMyBnTNx8b1MYEW/hGTudPNm42pBenYV8wI
	9Q1NeH2iClLjRfxIkAos2HVu5uFgklWapcPMgs+HVow/tgF+hOfyblR7u2h5RkfrDi3Ka9479XF
	btkJPStXoa3oJOYuy2dmjzLAQ=
X-Received: by 2002:a05:622a:1803:b0:4e8:96ed:2e65 with SMTP id d75a77b69052e-4edf2064a31mr255984641cf.22.1763537049671;
        Tue, 18 Nov 2025 23:24:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjzLZW6IlsOc6+GhL6wA/e+XXYhjV7QvGWz3O/kSOtSMbarqzzvvRP/4Qb8io77jfdUXdDmg==
X-Received: by 2002:a05:622a:1803:b0:4e8:96ed:2e65 with SMTP id d75a77b69052e-4edf2064a31mr255984291cf.22.1763537048814;
        Tue, 18 Nov 2025 23:24:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9cee2cb5sm38800241fa.45.2025.11.18.23.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:24:07 -0800 (PST)
Date: Wed, 19 Nov 2025 09:24:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kssb@qti.qualcomm.com, psaddam@qti.qualcomm.com
Subject: Re: qcom: Update DSP firmware for Kaanapali platform
Message-ID: <x55ygbtgvxscg4q7hzgq6ug24eqpaoqwgsxlyjqmbt4n4dn56i@vnjej4id5ae4>
References: <c5de392e-9c65-4021-b7e7-3a81329f170a@oss.qualcomm.com>
 <CAO9ioeVYMOR_+QdkQk6YM0YdH0Hvi+TjmUfQ6-X7=nLfnG9JbQ@mail.gmail.com>
 <3a84fa28-e4a8-4875-b655-293011d3ce63@oss.qualcomm.com>
 <tqpvpnh7f2gbkhw733aux44vzfcd6fd5i4e55zxidj6rl7jafh@6y7776gkbgyf>
 <217efcc4-2b34-4c57-bdda-16adc064a5ed@oss.qualcomm.com>
 <lxldmx2ulavqsijroufa6btxf67t2bocjovnjzxeeqbdd35ri3@dhouz4i7so42>
 <d3646263-0ffe-4a16-9baf-81202d481ea8@oss.qualcomm.com>
 <2b6b8cc3-ece6-485d-8295-e7fa039f5093@oss.qualcomm.com>
 <yh2aitnbknjfwp4h7j2v3d6epaqjkf2tk4vlaxuqpmxozios7m@4vnxsqlqztfo>
 <a47b8001-b63f-4711-8631-d8851f409b5d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a47b8001-b63f-4711-8631-d8851f409b5d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA1NiBTYWx0ZWRfXz3hjxnbyjszj
 NIJlSjqBZdLaWw+cuE8wIep4a15v0aqO9K15cAZvBG1yIIChZ55G2nlq6tY9vvBUYTDsJiAdxT6
 +l9BCIzP4aRE31y9gHnpcGr2EJxMHoDA+mymjJ+7OBDG+4PEasSghGX9FNwBwNjiDkTQpcXuswd
 zkRtOa5UlVkIhahYYPOx+eNLrqkNsgIwBNkNw25DvkfbOBW1NMdf0ijajNX4N8YlXMQ14RsxlDa
 TZYiL1UicMr9O/e15t6ARGNtauWcdqUIuHGZc1ngINVEMP048GM/St/e+axOAy15lvlG7aHf+wH
 s5ScQB9Q5wjg8bZTzjofmXr/4+o/+WHwI19daCTHox+R/pbyAz72xEGLFnCuZ6zSrr+HV6FARaj
 OF3Megk0QaHXJtFUzeL+aaP+/3XHLA==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=691d709a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=-1opn274SwlH8ZJXnEEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 73BGP5m9UYYCLtvsR1sexlWysdt5rhEQ
X-Proofpoint-GUID: 73BGP5m9UYYCLtvsR1sexlWysdt5rhEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190056

On Wed, Nov 19, 2025 at 08:38:14AM +0530, Venkata Kota wrote:
> 
> 
> On 11/19/2025 1:15 AM, Dmitry Baryshkov wrote:
> > On Wed, Nov 19, 2025 at 12:20:03AM +0530, Venkata Kota wrote:
> > > 
> > > 
> > > On 11/18/2025 11:40 PM, Venkata Kota wrote:
> > > > 
> > > > 
> > > > On 11/18/2025 11:26 PM, Dmitry Baryshkov wrote:
> > > > > On Tue, Nov 18, 2025 at 09:20:23PM +0530, Venkata Kota wrote:
> > > > > > 
> > > > > > 
> > > > > > On 11/18/2025 9:04 PM, Dmitry Baryshkov wrote:
> > > > > > > On Tue, Nov 18, 2025 at 08:05:04PM +0530, Venkata Kota wrote:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > On 11/18/2025 7:56 PM, Dmitry Baryshkov wrote:
> > > > > > > > > On Tue, 18 Nov 2025 at 16:21, Venkata Kota
> > > > > > > > > <venkata.kota@oss.qualcomm.com> wrote:
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > On 11/18/2025 4:28 PM, Dmitry Baryshkov wrote:
> > > > > > > > > > > On Tue, Nov 18, 2025 at 10:24:03AM +0530, Venkata Kota wrote:
> > > > > > > > > > > > The following changes since commit
> > > > > > > > > > > > 53adb2085ca81337df2db20b96898b1980e310ff:
> > > > > > > > > > > > 
> > > > > > > > > > > >        Merge branch 'aic100_1_20_2_6'
> > > > > > > > > > > > into 'main' (2025-11-18 03:16:11 +0000)
> > > > > > > > > > > > 
> > > > > > > > > > > > are available in the Git repository at:
> > > > > > > > > > > > 
> > > > > > > > > > > > https://git.codelinaro.org/clo/linux-kernel/linux-
> > > > > > > > > > > > firmware.git
> > > > > > > > > > > > dsp-fw-kaanapali
> > > > > > > > > > > > 
> > > > > > > > > > > > for you to fetch changes up to
> > > > > > > > > > > > d6afd7f0d0c9f4649880f36eff7a5fe4ef0386cf:
> > > > > > > > > > > > 
> > > > > > > > > > > >        qcom: update ADSP, CDSP firmware
> > > > > > > > > > > > for kaanapali platform (2025-11-18
> > > > > > > > > > > > 10:20:00 +0530)
> > > > > > > > > > > > 
> > > > > > > > > > > > ----------------------------------------------------------------
> > > > > > > > > > > > Venkata Kota (1):
> > > > > > > > > > > >            qcom: update ADSP, CDSP firmware for kaanapali platform
> > > > > > > > > > > > 
> > > > > > > > > > > >       WHENCE                      |   4 ++--
> > > > > > > > > > > >       qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
> > > > > > > > > > > >       qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
> > > > > > > > > > > >       qcom/kaanapali/cdsp.mbn     | Bin 4956632 -> 4960728 bytes
> > > > > > > > > > > >       qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
> > > > > > > > > > > >       5 files changed, 2 insertions(+), 2 deletions(-)
> > > > > > > > > > > 
> > > > > > > > > > > Should these files be covered by LICENSE.qcom or LICENSE.qcom-2?
> > > > > > > > > > The files should be covered under LICENSE.qcom-2
> > > > > > > > > > Made the change to the
> > > > > > > > > > WHENCE file to reflect the same as below
> > > > > > > > > > The following changes since commit
> > > > > > > > > > 53adb2085ca81337df2db20b96898b1980e310ff:
> > > > > > > > > > 
> > > > > > > > > >        Merge branch 'aic100_1_20_2_6' into 'main'
> > > > > > > > > > (2025-11-18 03:16:11 +0000)
> > > > > > > > > > 
> > > > > > > > > > are available in the Git repository at:
> > > > > > > > > > 
> > > > > > > > > >        https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > > > > > > > dsp-fw-kaanapali
> > > > > > > > > > 
> > > > > > > > > > for you to fetch changes up to
> > > > > > > > > > db069c95dcc16ea84dacb80488464e843ea252cc:
> > > > > > > > > 
> > > > > > > > > You've silently changed the licence without
> > > > > > > > > mentioning anything in the
> > > > > > > > > commit message. That's a no-go.
> > > > > > > > <Noted> Made the change to the commit message accordingly.>
> > > > > > > 
> > > > > > > Could you please add a word about it to the commit subject
> > > > > > > too? ('update
> > > > > > > firmware for kaanapali platform, change the licence')
> > > > > > Updated. Please Review.>
> > > > > 
> > > > > Now, why do we have two groups for kaanapali there? One with soccp and
> > > > > another one which you have just added.
> > > > I am not sure about soccp FW. DSP team does not track that firmware. Do
> > > > you suggest to have all of these close by. I was not aware of soccp and
> > > > just add Kaanapali fw below the rest of the DSP FW.>
> > > SOCCP is for RISC-V and the DSP FW is for the ADSP and CDSP.>>>>>>>
> > 
> > And what is the difference for anybody outside of Qualcomm? It's just
> > firmware for remoteprocs on the Kaanapali platform. Neither does it
> > matter, which team manages the firmware. Please group the entries.
> 
> Updated the same now. with below.
> 
> The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:
> 
>   Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-kaanapali

Slightly adjusted, merged, and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/787

Please be sure to submit updated DSP libraries to hexagon-dsp-binaries.

> 
> for you to fetch changes up to 62db06fe95b9755837ba2faf1df6eb0983e4990e:
> 
>   qcom: update ADSP, CDSP firmware for kaanapali platform, change the
> license (2025-11-19 08:32:24 +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: update ADSP, CDSP firmware for kaanapali platform, change the
> license
> 
>  WHENCE                      |  22 +++++++++++-----------
>  qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
>  qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
>  qcom/kaanapali/cdsp.mbn     | Bin 4956632 -> 4960728 bytes
>  qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
>  5 files changed, 11 insertions(+), 11 deletions(-)
> 
> > 
> 

-- 
With best wishes
Dmitry

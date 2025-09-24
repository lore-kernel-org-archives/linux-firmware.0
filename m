Return-Path: <SRS0=3Sp+=4D=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2517CAC5A5
	for <linux-firmware@archiver.kernel.org>; Wed, 24 Sep 2025 16:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7793C4CEF0; Wed, 24 Sep 2025 16:23:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1638C4CEE7
	for <linux-firmware@kernel.org>; Wed, 24 Sep 2025 16:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E1638C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODFGo1019923
	for <linux-firmware@kernel.org>; Wed, 24 Sep 2025 16:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Krw5evwTP6CgXjf5nCLoUUjA
	pXNraiDAcieXjVUyfng=; b=Jj+rhc+ILcD5O8wI97yHSD9RKgONPFVmA1AJvOKa
	Z9vzQPNgdIU/R3f0eXekzODqBGmqDaWk9sn2CKyS/dEh6lVFRifvCPruNsQJ9+23
	NA6XtYUKepqPwUOBFg5l7aswh1Tscg3WT1YFc6rK+S2cXD3MZOF87jBvORtn0v/g
	C18nNrGapGCMDBR+FH4DL7GlGmsz2usydtlygRnuna5sD9DUZI1rU8exixz5yuEP
	TSc4xBUjhGQO5dVe7RIdHeg0DoSI/59Ms6pcwG89elEW+rS0smnFfo1AnlxjERI1
	Q/xUqaOb9J3uLZuxCgUR1gc31GxHQVxc/OxhBZe6mokxMQ==
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdx7jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 24 Sep 2025 16:23:55 +0000 (GMT)
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-892df556b68so10373239f.3
        for <linux-firmware@kernel.org>; Wed, 24 Sep 2025 09:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758731034; x=1759335834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Krw5evwTP6CgXjf5nCLoUUjApXNraiDAcieXjVUyfng=;
        b=ulGdEgpaeGCZ6TljO+5c2vvLXah7RHHWPTB5Ub69YE7YQ1ExnHrNzhzVgryommEAwB
         xosDH2KClVBhVndKXgnts5MQPys1RYuGG67/nXBBuAsxMJN0UuufJe8+c9yEDkrncWCR
         XiT2rHmL0rdkHSPh7NiF2hpRt0BvsmfNKypzDIaQFSspYybm5cK9jzRyGliKD/AL7gvg
         BhDMnw5IyLlAYcTi5yWA31RBP4AlGfurI2k2RpokruJ6rorb0mmDCv9I4IdLMJqFphdS
         Pio9P0ArWNl+A5s05bHtYGzXt4Nx86ILwqCzuDaeeU8i9oxAo/2/IY+INWy8tdRU82q9
         L1SA==
X-Forwarded-Encrypted: i=1; AJvYcCWNVnDOHeG6B/nPzln9YCgK9WNZzevYdCckEZ4QlDMo1KGkK5KG0HxgZG4xM8L9MbMWEBL6YsOVh1FYSx3MrA==@kernel.org
X-Gm-Message-State: AOJu0YxHq0TLT6T1/9LbJAu7tohrq4VmUIfqlmm0bRzu2tDVM2nd28as
	PFvbuZuacGsh970j/ZVoRwEZeuDMX2bXxYarTylrClqw3rCD748YBV/dC9PbI3Zj7FZg6+vdJBF
	96KZ28g1cGH+nZBrqHQ0v6p5cwpeTa3aKegLcMMgf//51iGRVCNLiUW0WolLxO/Q=
X-Gm-Gg: ASbGncv04oMva+HTtNcMRerUkb+s698qLBTCH+WEOrJRn001xi2JBDop1AIZ3ynJ4WB
	ICqndAtX0fatBRVMQOIApuZBzx6TDaiIjVcav6FSfMU9ePRykNQ+2f2HeHCzbRQBP5jN+V6ZfvG
	FVIBfQxL/Xkb+a4B2wChGKG2io5owhsF8L2MMpXTc6tI3e1D7V2h9RjWLue7/XEm/Xsw9GeN0PK
	jAtMLkVVKp32eCgQwHDKg+oB6oFxBOU3QzkMyS2iH85j4ujijsx/joaS/ZGS0vnTrzWLr9lYEDl
	cAPhK3QKuqbcQbtk1g2+IvfX87xjc+kB0jgywr+ZWW34tTjMzgN5dtr73B1BviU8VqC4IH05hqG
	UCypCpImUirW9qP9pXIOj5efjbo1PaAFNSBIofprHogZExqpHoSXg
X-Received: by 2002:a05:6122:21aa:b0:54b:c417:4d7c with SMTP id 71dfb90a1353d-54bea1be7a8mr259671e0c.1.1758730580201;
        Wed, 24 Sep 2025 09:16:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUHWPIM5Of4Y0TAGDS15oBqglcyuMuFvGPN4aUuKS7ElrCivlZ1M3UXbvxt6poQZ+/tCrU5g==
X-Received: by 2002:a05:6122:21aa:b0:54b:c417:4d7c with SMTP id 71dfb90a1353d-54bea1be7a8mr259623e0c.1.1758730579478;
        Wed, 24 Sep 2025 09:16:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-580d028dd53sm1370569e87.122.2025.09.24.09.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:16:18 -0700 (PDT)
Date: Wed, 24 Sep 2025 19:16:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
Message-ID: <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf>
References: <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
X-Proofpoint-ORIG-GUID: Jp6y5nYafX1wxS4PgtTDpwZZTGr5ZqDl
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d41b1b cx=c_pps
 a=WjJghted8nQMc6PJgwfwjA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=j39FK1liLGs_1Rz8EMoA:9 a=CjuIK1q_8ugA:10
 a=CtjknkDrmJZAHT7xvMyn:22
X-Proofpoint-GUID: Jp6y5nYafX1wxS4PgtTDpwZZTGr5ZqDl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX1lMDq8JnWeVr
 oDRwIPzfZcpWVtPcFvdeWLySl3SNOsxh7r1WO++qaEfuuAk/HpOgk1OFq8wqCRjMaBc9EBkGqgf
 lnMsrG3hndyASM1+3pBE/d8NftJE3ePUptH0CGfBIVx8/q/7DXU/u8NQ2qIroC82TapBKdfa+CJ
 ths698qOLLD+Z0PGhk9I5KYX13knUU90ZMrTZAbIVDGLwb2NgLw5L0T2keCtUlJtWjP+YXgzxZY
 57ww7n7xwf0OlTdUEu3CsoKTC2h9nPcFjASb8NLU0s8adQyNMWDVbSsp41Ea0knJyUH23cuWvMO
 WVtJr1NAuCAyQHeCdWvhDcHwoVIW6/Hjwto68Or7W3A3CXWIZ6kvvtfA+mdgfMMtAuuqSeW+fik
 uTgVL58A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

On Wed, Sep 24, 2025 at 01:55:22PM +0100, Bryan O'Donoghue wrote:
> On 24/09/2025 11:43, Dikshita Agarwal wrote:
> > > > I understand your concern. To clarify, we are not removing support for the
> > > > existing Gen1 firmware, so backward compatibility remains intact.
> > > > 
> > > > We are simply adding support for Gen2 firmware for this architecture. As a
> > > > result, QCM6490 will support both Gen1 firmware (with the Venus driver) and
> > > > Gen2 firmware (via Qualcomm's video driver [1]).
> 
> I agree with Dmitry here.
> 
> Its not possible to disjunct upstream HFI6xx @ the firmware level between
> Venus and Iris because the DTS would have to point to a particular firmware
> depending on which driver you wanted to run, which would make the DT
> dependent on the driver, which is not allowed.

The only possible way to make that work would be to:
- make iris driver detect the firmware interface and then use either
  gen1 or gen2 interface
- make that into the upstream kernel
- drop venus support for sc7280

> 
> > > > Additionally, as part of our plan to transition all Venus-supported targets
> > > > to the Iris driver, SC7280 will continue to use Gen1 HFI and Gen1 firmware
> > > > to maintain backward compatibility.
> > > Dikshita, this is nonsense. Venus and Iris drivers are supposed to be
> > > interchangeable for the hardware they both support, until the venus
> > > driver drops support for V6 hardware. At that point it's expected that
> > > there will be no V6 support in Venus driver.
> > > 
> > > You can not simply upgrade to Gen2 firmware as if nothing happened.
> > > Consider a device node on SC7280 / QCS6490 with the firmware-name
> > > pointing to OEM-signed firmware. Both Venus and Iris drivers would
> > > happily consume the device node and try to work with it. One will work,
> > > another one will fail. This is definitely not what we have agreed upon,
> > > when you started adding Iris driver.
> > @Vikash, could you please chime in?
> 
> It would OTOH be possible _only_ release a HFI6xx Gen2 firmware for a new
> SoC that doesn't appear upstream yet but, that's not the case with
> 7280/6490.

-- 
With best wishes
Dmitry

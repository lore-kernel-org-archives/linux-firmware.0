Return-Path: <SRS0=3Sp+=4D=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E362CAC5AE
	for <linux-firmware@archiver.kernel.org>; Wed, 24 Sep 2025 16:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F1CDC4CEF0; Wed, 24 Sep 2025 16:19:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A2A2C4CEE7
	for <linux-firmware@kernel.org>; Wed, 24 Sep 2025 16:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2A2A2C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD5Inp021489
	for <linux-firmware@kernel.org>; Wed, 24 Sep 2025 16:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gR9eA6aZWF8E4dXEegqAui1p
	eJBgAB65BM+ZgtNMd2g=; b=Yhj02I8wFJxVGGp9vnrvfpO3TzhGwvJcF1OLLcPi
	F+br8RxOK5O8DExUI532/A24xNlorToEw5AQTrTAI21kQiGnAdvNvxnHEx/ztRj+
	7ExkDbEQQPvjSMDBhqB0Uo8PBjdnWKENZ1VCxiTBFPpg41HWSu/OVmB8A1bP7Wzy
	jM/hqxgsqwiqZyVZaq2CupkZLrC9nUFkR2j3RLlSjPjR3fEP0XyXckP6h8QSSjHc
	/LaAKtYJftkngtVzZipp544VdsMw9Z5qRPpa2ga5ABNhCttfgkT5LoRocCTCPm8a
	gkovWQqwq3dj2Zrsv0kpP5eIKXTTEfqSoQ1bVRXIFY17EA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budack47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 24 Sep 2025 16:19:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b633847b94so247701cf.3
        for <linux-firmware@kernel.org>; Wed, 24 Sep 2025 09:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758730780; x=1759335580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gR9eA6aZWF8E4dXEegqAui1peJBgAB65BM+ZgtNMd2g=;
        b=QZWfggKOUg4DYFidMlu5IIDsK6Ywn/7ZpfrruARDEJD3Dcv7CSlx0HjfXVMjYCQq6M
         zRnKZfWcWYwBStRJ5ATGGs3lATfm2/yMwDnQzcYu+/Vgwa5RZLEe2kHZJTcNQkcFjwGm
         vqKClw5blvfAg53h0vPKLWfzmS0McGMte0HZr5lwWBqPSl3gb+Bw+TPvkJneqRGldODp
         3fMRsWOmV849eNSmoUuoKJCQzmcpr2tBtEsZiahIuDQqeUEGE6dE3NtR7hkCjp/QvJja
         cHX0O4qux5GreibUC+XId2hdAXq730HueZPKozqF9/i1l/WGid64UQWpqIi92HJiy2Wd
         kHiw==
X-Gm-Message-State: AOJu0YxxmXzjwsxIjLUEIVfpJpXR/rhR6+8T7MgXtMWLfgfov3ielHFo
	Ehlmnw5MhnzAhd1DutXQz22ByGqmH0JSKL3dyah01K7NAYG5fQUuQ46sKn/6kvv4ZgvfqQkaVom
	7yZbVvJib2ZvyHUqpc8YMzQd6eLVns8Yb6n6cBt36noTeQdeFPXAWZPGtxHoxRuo=
X-Gm-Gg: ASbGncv2xDxWV+L6JwNMEQ1VMUtn4ERUZpqxz53Mk1+IomCnHTY0pRR4MYBaQAgnf0W
	zSg/91jo5N1sUbeidc3DjX3CW4ychmW9ZOB2emZBjYi08M4a5IvKBCBFu93Hq8xQbVfpwribxQY
	hWeaZdOW539+3h04Ub8mO7SZpWEwB2NIfA8OB/cViR1kPthe/ec6RrmGZVdywgRpledvgv2ka5S
	Gjk/aRer2IDmopSF1m9cH9Gd11L1WWi4UPih7Y49cOifrxxP09xkyXEA4hJVQ2jNWEbFl2b/PgO
	g0/8pVrw+64k7D9KnW2d7v/dNEEut9VImFFhTQf98BD4mZF+MGB5VlKD8e24eQDPE4UDA7SSlHR
	BRF1z1+GvAzU4/khXlml0kcZ6TU/SilJm8QuBuoTJZhhFdtMr3M/H
X-Received: by 2002:a05:622a:58cf:b0:4b5:da13:3b70 with SMTP id d75a77b69052e-4da4782968amr5185371cf.10.1758730779779;
        Wed, 24 Sep 2025 09:19:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkAanqfHX9CfFKpvT+RuBkScQq+kYak25rLi0wWPVv2EFeFr+6IupubdrlrYUBnMZ4wld4Xg==
X-Received: by 2002:a05:622a:58cf:b0:4b5:da13:3b70 with SMTP id d75a77b69052e-4da4782968amr5184941cf.10.1758730779069;
        Wed, 24 Sep 2025 09:19:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a9573541sm5186824e87.108.2025.09.24.09.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:19:38 -0700 (PDT)
Date: Wed, 24 Sep 2025 19:19:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
Message-ID: <kuzmjcombgjlp2j3lesotcvlsdvxharaw2hxdvxtgkan2aaaco@245ykhkyhred>
References: <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
 <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <sg2txjdr4ugybqk4bvqokt4ebrt3uf4rdeut2n4qrqjdne2ifl@hlbbk5xruspq>
 <0e449b29-9a6e-d611-706f-bee8829a2df4@quicinc.com>
 <yavr2v3rbpybdn72spa7562wtbktmtkzefgzvpfhhslveml6tk@3evl5t4atuhr>
 <bfbac3e6-34ef-0049-1cf2-a6f4a7bb9f17@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfbac3e6-34ef-0049-1cf2-a6f4a7bb9f17@quicinc.com>
X-Proofpoint-GUID: O2wBwQ5K3GDUjuaI52N3M7tjJHShNsbV
X-Proofpoint-ORIG-GUID: O2wBwQ5K3GDUjuaI52N3M7tjJHShNsbV
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d41a1c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=2CIQP-nms-0995Yf0gAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX18Jk1Rm+RW08
 ThIYnvSLtivxPGpwl7wXmX1HoPaCh+7S0W2fky1L2JxZpYWNDdhzpg7uyC1OMlrwpyU0ltZ1BUH
 NuAhRh6wz/FC6Id8KbyBsm586nEucLmbHcnFZMIorsC0TpikPAHwzItFdHYDguDaktSB2v3SYx0
 2s2k6QaVFGf7d23I1saR0KVu1togzvvTwSJsY9PG/HULE+HhqqQy8ABBcuR9Zvd66NkmDFVDsns
 9ZksuJUs5VXYICq/FsKc+O9fSuOXcSHCm+UFAmak2n2l+CKMPsbmL9XwC8qake+0TEAYmfbDp4F
 Xvnk4Vwfh/NStjX7Rn+UkC3F9s7jWujeZ466dxyUiNbQ9TGXRY0zTaa1zaQBDwrIX1LEeF17Iuz
 cYbZq0bO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

On Wed, Sep 24, 2025 at 04:12:12PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 9/19/2025 7:32 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 19, 2025 at 12:18:29PM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 9/18/2025 5:54 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Sep 18, 2025 at 10:39:20AM +0530, Dikshita Agarwal wrote:
> >>>>
> >>>>
> >>>> On 9/15/2025 8:08 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, Sep 15, 2025 at 06:27:57PM +0530, Dikshita Agarwal wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 9/15/2025 5:29 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Mon, Sep 15, 2025 at 04:44:58PM +0530, Dikshita Agarwal wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 9/15/2025 4:09 PM, Dmitry Baryshkov wrote:
> >>>>>>>>> On Mon, Sep 15, 2025 at 03:40:24PM +0530, Dikshita Agarwal wrote:
> >>>>>>>>>> Hi,
> >>>>>>>>>>
> >>>>>>>>>> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
> >>>>>>>>>>
> >>>>>>>>>>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
> >>>>>>>>>>
> >>>>>>>>>> are available in the Git repository at:
> >>>>>>>>>>
> >>>>>>>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >>>>>>>>>> video-fw-qcm6490-update
> >>>>>>>>>>
> >>>>>>>>>> for you to fetch changes up to 6313c3b6ec0713d2cae0ac2aed050d70a50526ce:
> >>>>>>>>>>
> >>>>>>>>>>   qcom: vpu: fix the firmware binary name for qcm6490 (2025-09-15 13:44:49
> >>>>>>>>>> +0530)
> >>>>>>>>>
> >>>>>>>>> From the commit log:
> >>>>>>>>>
> >>>>>>>>>> Fix the firmware binary name to reflect the correct sectool being used
> >>>>>>>>>> for signing. Also update the version to add some recent fixes.
> >>>>>>>>>
> >>>>>>>>> Using different sectoosl isn't a determining factor. It's the security
> >>>>>>>>> profile and thus different MBN header versions.
> >>>>>>>>>
> >>>>>>>>> However, why is it important here? We have added vpu30_p4_s6 for the
> >>>>>>>>> sake of QCS8300 which requires MBN headers v6 (unlike SM8550 which uses
> >>>>>>>>> v7). Do we have such an issue with vpu20_p1_gen2?
> >>>>>>>>
> >>>>>>>> its the same case here, qcm6490 also required MBN header v6.
> >>>>>>>
> >>>>>>> But why do we need to mention that it's v6?
> >>>>>>
> >>>>>> we need this to be able to distinguish from the firmware binaries which
> >>>>>> doesn't need v6 header, we are following the same for other SOCs as well.
> >>>>>
> >>>>> Do we have anything to distinguish from?
> >>>>
> >>>> As of now, we don't. But in future if a new firmware is needed for the same
> >>>> hardware generation which doesn't need MBN header v6, how would be distinguish?
> >>>>
> >>>> So either we keep the name with _v6 now or change it later when a new
> >>>> firmware is uploaded which doesn't need v6.
> >>>
> >>> I'd say, if there is a need to distinguish something in future, then
> >>> that something-else firmware should get a suffix. Unless we want to
> >>> establish a rule to have the _sN suffix all the time and rename all the
> >>> firmware to follow that rule.
> >>
> >> Currently we have named the firmware as vpu30_p4.mbn (kailua)
> > 
> > V7 headers
> > 
> >> vpu30_p4_s6.mbn (Monaco with mbn header v6), So i was following the same
> >> convention for qcm6490 firmware as well.
> >>
> >> So if/when SM7550 is added upstream which is the same architecture as
> >> qcm6490, but doesn't need MBN v6 header, the corresponding firmware could
> >> be added as vpu20_p1_gen2.mbn.
> > 
> > Doesn't need v6 header or will break if we use v6 header?
> 
> yes, firmware load will fail if we use v6 header binary for SM7550.

Okay. So, we really need to add the _sN suffix to all firmware files.
Would you please send a patch adding those (and adding all compat
links).

> 
> > 
> >>
> >> Thanks,
> >> Dikshita
> >>
> >>>
> > 

-- 
With best wishes
Dmitry

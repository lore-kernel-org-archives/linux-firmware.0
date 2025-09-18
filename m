Return-Path: <SRS0=8enH=35=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1493ECAC5A0
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Sep 2025 12:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB688C4CEF7; Thu, 18 Sep 2025 12:24:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0F376C4CEE7
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 12:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0F376C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IBHh6Z010750
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 12:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gyxrhmi2wZU0aCfvVZcCgPxO
	3s+D93GIwVNUzEc1Fkw=; b=Q1jqsjLsymT4W8W4RUbCvsDIVB4u9Eww9yER5VUq
	HFkUFYMJHIa2ssMEY98mKfx9ks/yJ6XIRKg8JZ/rxa8VOiEBTn/yCqWNK9sBinB0
	W3ji33eDuFu8TUrk8ocktmuQFVLUJJ6lB2e01YjrJr8Ra46yST/XDDLae0fCH3UF
	FmxX0VtPR0vFKRWI/PKDI5VY1wxHM+x49tKiM9tx//dit6+Td5QaOzBdyOokX8uZ
	8e5tL1qvi3WxHgE5kVwmhBBAfgE3UyMWqzI7Hq4DewMbLT0DLHxq/E3d9D40zaA7
	HWnNdCutb5ZjOilYVRqRUFLky/IWkLZLoLMGOdkInFE06A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxx8y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 12:24:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b302991816so23106241cf.0
        for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 05:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758198289; x=1758803089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gyxrhmi2wZU0aCfvVZcCgPxO3s+D93GIwVNUzEc1Fkw=;
        b=cDwTWHVWzSLHJLbQf84onHaX23pYqX5mqMSEP5UvosyOtPL3C2tHmVTPqj+FTQ8cAF
         kXvHBeKKJx6KwFIpzPo6/D4qdp2o4Xw8aTG1j1gSgkqQHS9FuypiZxnroWpleTzlEajg
         YHbdWOjl3Vgau+vXfEsEVe8f55RJebaqyaA83CkkZsd4IDv1VP8qkM7y1Vj3cGIUc3xC
         EcBRy9v0OIu2XtZVx7JAdeiasKIb8DfkDDt3WBcSpGnlLWusdgmyDzL9pNE0ZM2171WA
         ZYv6nbkS2x2NRgjwZ6RFTqfsHIz3SipwEhMP3hKeijXmb/iITaNtMzqqz9Jiiw1hA9qX
         3/sQ==
X-Gm-Message-State: AOJu0Yzfu+yDve1Ei99quY3fzJCl/dt2IEVdIosX0LB5dbESerFgDIgU
	YUv2vdzETu9R4f9nGW3npm5MT5l4KZ5GrWW885D0ZFZ04+5OsL3EP05UorNvlv5J31clTEVa1vA
	PBwK70wOQhhMEGpA9/Iuol1UVziAgnZyc4nZDgWDlbyoNOzZSkUNPEGULQXPNug4=
X-Gm-Gg: ASbGncse9xpOUUOtZAPYD+8nuFmzfDOxMqfyJDtGY7X+tSa09W7O5nqqkJw80LlLQsr
	vOLrB7CwjBlLz7gxxmjg0kWLg3QHsOdwVfLHYBF2lp1hK9eXAgu8TkWOor9oTwfqitTzjp9zV4r
	SageuyateJqs9q2yEvoLt73ObEjDfHjW/2HlTeVGOkVqRUu/cLiJ+1Hed/i5IKBvlzw+rnST7lP
	kD5NkrfzP18XTFvaGItrdFNK9k+gWJlqst1pEhHfNIdSM+MvlqdK6m4uo6t1pxpVUkT9z7fRoxy
	KqCMSymqptnFxiaFZ2RTvXJ23snMlhsgWm3ym9JQM4IlCIlproWPyEcohlmwodWeZmwXpiRQIHc
	cfp17OeLimu2KkPSr5zLAI313KyZHMAQsg5PQQZNDngZ6dzdM3YnT
X-Received: by 2002:a05:622a:1394:b0:4b7:a62c:3747 with SMTP id d75a77b69052e-4ba6ac992c4mr61545601cf.46.1758198288470;
        Thu, 18 Sep 2025 05:24:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkaY+Lto83Jnw8vSk3c326tFpKTGeNi62KfqFIOxnIlr9J0XmkFiU+QNZP8XofHAKvrHcJVQ==
X-Received: by 2002:a05:622a:1394:b0:4b7:a62c:3747 with SMTP id d75a77b69052e-4ba6ac992c4mr61545211cf.46.1758198287802;
        Thu, 18 Sep 2025 05:24:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361aa38b3b4sm5556901fa.61.2025.09.18.05.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 05:24:46 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:24:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
Message-ID: <sg2txjdr4ugybqk4bvqokt4ebrt3uf4rdeut2n4qrqjdne2ifl@hlbbk5xruspq>
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
 <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX7UhP0EG+LbW+
 /tptKlmeRkBitOwuTz6YDtflCaizIFKoq6w7gMAFonaeWd1xEEdFT612O8Fh16caqTZIoJsNvdv
 +jgoqM6uXSZN0gI5vTG/OxryCu0UClKxJteTgGVcjFY7c/hSniPboJ3JySOqnBSFX/yFddbgJrR
 z/PV176Gr2GqX2olXum5Nx8bFWBf6amPmMv03AmduZrOBYhT11NryBldtTU/NRb1pYfHq1e+rJF
 982Vi+4K65VUduUv31bKMSSsdOKtp1F1s8MopH/irDNiLkroZ0gMiFqY+NrmcNqYC2mWcLBZy1S
 Tu6pxREZJ6OhuQaVjIvtDGnTjHtE3hpdafYq/XWtdcwY9dgBeo+xgujbXULdM8xw0zK+4z6Jct6
 qyYQYQt3
X-Proofpoint-ORIG-GUID: bq1CfftX3CfSgvzoy27YXfzxZPQbRIns
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cbfa12 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=DvCudvvZNXikzlsx3zoA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: bq1CfftX3CfSgvzoy27YXfzxZPQbRIns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On Thu, Sep 18, 2025 at 10:39:20AM +0530, Dikshita Agarwal wrote:
> 
> 
> On 9/15/2025 8:08 PM, Dmitry Baryshkov wrote:
> > On Mon, Sep 15, 2025 at 06:27:57PM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 9/15/2025 5:29 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Sep 15, 2025 at 04:44:58PM +0530, Dikshita Agarwal wrote:
> >>>>
> >>>>
> >>>> On 9/15/2025 4:09 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, Sep 15, 2025 at 03:40:24PM +0530, Dikshita Agarwal wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
> >>>>>>
> >>>>>>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
> >>>>>>
> >>>>>> are available in the Git repository at:
> >>>>>>
> >>>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >>>>>> video-fw-qcm6490-update
> >>>>>>
> >>>>>> for you to fetch changes up to 6313c3b6ec0713d2cae0ac2aed050d70a50526ce:
> >>>>>>
> >>>>>>   qcom: vpu: fix the firmware binary name for qcm6490 (2025-09-15 13:44:49
> >>>>>> +0530)
> >>>>>
> >>>>> From the commit log:
> >>>>>
> >>>>>> Fix the firmware binary name to reflect the correct sectool being used
> >>>>>> for signing. Also update the version to add some recent fixes.
> >>>>>
> >>>>> Using different sectoosl isn't a determining factor. It's the security
> >>>>> profile and thus different MBN header versions.
> >>>>>
> >>>>> However, why is it important here? We have added vpu30_p4_s6 for the
> >>>>> sake of QCS8300 which requires MBN headers v6 (unlike SM8550 which uses
> >>>>> v7). Do we have such an issue with vpu20_p1_gen2?
> >>>>
> >>>> its the same case here, qcm6490 also required MBN header v6.
> >>>
> >>> But why do we need to mention that it's v6?
> >>
> >> we need this to be able to distinguish from the firmware binaries which
> >> doesn't need v6 header, we are following the same for other SOCs as well.
> > 
> > Do we have anything to distinguish from?
> 
> As of now, we don't. But in future if a new firmware is needed for the same
> hardware generation which doesn't need MBN header v6, how would be distinguish?
> 
> So either we keep the name with _v6 now or change it later when a new
> firmware is uploaded which doesn't need v6.

I'd say, if there is a need to distinguish something in future, then
that something-else firmware should get a suffix. Unless we want to
establish a rule to have the _sN suffix all the time and rename all the
firmware to follow that rule.

-- 
With best wishes
Dmitry

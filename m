Return-Path: <SRS0=WOkb=36=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32721CAC592
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Sep 2025 14:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EBCF9C4CEF1; Fri, 19 Sep 2025 14:02:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3085C4CEF0
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 14:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3085C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JA7Mb7007486
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 14:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=umC2CgMI2beKpWQFtroMka03
	YxmEZyVa1U+l5z6QWTw=; b=VveJc5GfcfIYOJgzSR2VI7Utxdt+ANDZ+scaf9yS
	QBD8jv28pSoIPeyjUy9g3mLyLLN//d1N04wBs2burtIOK0qQZiMBBpvYRzXUJqEX
	/XrvijuM03Bz+mCPEumZrhlHnaI4Y+zfq5UDvshoCv3hbILn3XihXEsKVxteAfO2
	etoCO9FxGSdjk7Wwbjk2u9LaTGXx5H8Fq+VbdcqIY7x5xmUAyi58saCSynX/chYh
	cJwCcDxDeo8j30AU1R1RP30y0bcljF/0T33X9RVUJnRq+YXvT5lYzvpTU83BgUaH
	evAa7zgMyHY33wZjYO73yLNeaOFg5pvXlEY+ioETswrXLQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498ebew4x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 14:02:12 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-54a7955dc59so584411e0c.3
        for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 07:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758290530; x=1758895330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umC2CgMI2beKpWQFtroMka03YxmEZyVa1U+l5z6QWTw=;
        b=ckEKaAgGrGtjX/RxqT7vR51LEa04gOBGjw3WXAhFqkUmEEjcvcPRUpr2nWhO5oSy7C
         eY0pIEMQcXCWIylOxyk+XHv8FiYNyah+2AreDq7zlV5mZKILVs5Z0bB4c4cw7G5vkrrR
         1M41G6qEKRv7YNQzh7rm37nthfPhOsRfbhbAMFSJHrO/cuXXyfT4Plweds6SrpJ4N7KS
         tD305lEv43e1WBFC4iWsNZO0NZzsG7Q0GllCOfaVd2kiAP044B41usp7V+91lIRnGxqG
         H8Ds3A8tqu7oQWcfQvIZUTzSlanx19yuVDdbTUKA7TG51+Ej1VHIMqaY7yJUjckLS48w
         0vaQ==
X-Gm-Message-State: AOJu0Yxq2eCwn3h1Nus2WB11LDbeBR9xtXyQJsnjoiOqIN4huLlSSwik
	pfCrWiuO5ZQSzOsBsz0agWMJzBCWQGLhcDiSHf82HjoUvhR2jv/j0bZvEgtkWEZd0qM07k2WIa0
	KMFCtQ94w8WHJkeTHTpuqq+8A61NOcZOuMd6f4GhkD5joT8+l1V0lidaaKvnxXsZ1qR4tZ88=
X-Gm-Gg: ASbGnct6hIgl59Gxl+kqzWCjL/gfcsLpbQzyl9cm6Y1LzAVDjZq7MtcC2cWEVQuHZqK
	bxCGvRn73TaUzikOVuFuylMBmPRB1pUukaWiX41khS8s+W48AUzSWaicZ/HYADEXo13tuULFBHu
	atmzmK+3a4E5vbChWywgck54wl01kn1xmcsl/5ZsLkTmX09ZkEm7hwd/AzEmoUtEZyYglNZPfB8
	rN8BvxhSOFiQj6TU/PGTiHmT5CBZjFqbMNUP/pS4GmfODqwVYkY9PCfmN7HjHzVUDO0/jFHJ1KA
	Vf0aQoO4zZdzg8BHPOhbnAvB/mzRFu7CyGxlH7FhEaterTE33KWJi68V4YnmG9gCJuSaJK17tbO
	/dNG030ngnVqk88ajqlWAaq3RpRSsa+YsZYSPkZ2SwvFju720IZ6p
X-Received: by 2002:a05:6122:919:b0:541:fdc4:2551 with SMTP id 71dfb90a1353d-54a8374bceemr1007028e0c.3.1758290529841;
        Fri, 19 Sep 2025 07:02:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExRlt8ypNXJKAg5eheGQJJsri5XEdBtTYuwljC8o25EQu0nxx9tYKNI5DDCnA03YM1tKls3A==
X-Received: by 2002:a05:6122:919:b0:541:fdc4:2551 with SMTP id 71dfb90a1353d-54a8374bceemr1006927e0c.3.1758290529179;
        Fri, 19 Sep 2025 07:02:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-363becf5350sm7387611fa.63.2025.09.19.07.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:02:08 -0700 (PDT)
Date: Fri, 19 Sep 2025 17:02:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
Message-ID: <yavr2v3rbpybdn72spa7562wtbktmtkzefgzvpfhhslveml6tk@3evl5t4atuhr>
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
 <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <sg2txjdr4ugybqk4bvqokt4ebrt3uf4rdeut2n4qrqjdne2ifl@hlbbk5xruspq>
 <0e449b29-9a6e-d611-706f-bee8829a2df4@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e449b29-9a6e-d611-706f-bee8829a2df4@quicinc.com>
X-Proofpoint-ORIG-GUID: AXTCjEng-u0xz3wgSlNizpgdgOZpxIRA
X-Authority-Analysis: v=2.4 cv=H6/bw/Yi c=1 sm=1 tr=0 ts=68cd6264 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=t_sWZMcHRULOzl9UpqcA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: AXTCjEng-u0xz3wgSlNizpgdgOZpxIRA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3NCBTYWx0ZWRfX5HTg/m+rVjMi
 44bH5s+sxXE9Yj2TyiNx7iy/CTFq4gSe2IyrbYcjNxDvTFw5KS8CgXNNlUajBpPPQ0tCtcV43nQ
 XyAJZKbjBVvVSi4O1OFwkn6N0CUn6KG7drmb6hfo2aMHiARB0Gh8yBN/twv2D6w1Jcs29ZCAkst
 63XRQLHChpgtVM1/MnPRIh0piSchOksuiu4d2eH7MtQ3/8/PdlpXpQL1kWxC+y8JaKO2H6GlPXB
 YrXvzisp1JGXJYykgxq36BZ6Aw4fv0pQYT5C3NLuQDmc8svttWb7ciUIZpqGSFPdWYtT8QgltWX
 ct3fIylpoQzDSEuZvvJxWXsPuX11cyETpNECnQH1qla2OYjjxg+K6QaVmq+dwWVKbS1DeqlAF2e
 r4jtoBAQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180074

On Fri, Sep 19, 2025 at 12:18:29PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 9/18/2025 5:54 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 18, 2025 at 10:39:20AM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 9/15/2025 8:08 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Sep 15, 2025 at 06:27:57PM +0530, Dikshita Agarwal wrote:
> >>>>
> >>>>
> >>>> On 9/15/2025 5:29 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, Sep 15, 2025 at 04:44:58PM +0530, Dikshita Agarwal wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 9/15/2025 4:09 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Mon, Sep 15, 2025 at 03:40:24PM +0530, Dikshita Agarwal wrote:
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
> >>>>>>>>
> >>>>>>>>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
> >>>>>>>>
> >>>>>>>> are available in the Git repository at:
> >>>>>>>>
> >>>>>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >>>>>>>> video-fw-qcm6490-update
> >>>>>>>>
> >>>>>>>> for you to fetch changes up to 6313c3b6ec0713d2cae0ac2aed050d70a50526ce:
> >>>>>>>>
> >>>>>>>>   qcom: vpu: fix the firmware binary name for qcm6490 (2025-09-15 13:44:49
> >>>>>>>> +0530)
> >>>>>>>
> >>>>>>> From the commit log:
> >>>>>>>
> >>>>>>>> Fix the firmware binary name to reflect the correct sectool being used
> >>>>>>>> for signing. Also update the version to add some recent fixes.
> >>>>>>>
> >>>>>>> Using different sectoosl isn't a determining factor. It's the security
> >>>>>>> profile and thus different MBN header versions.
> >>>>>>>
> >>>>>>> However, why is it important here? We have added vpu30_p4_s6 for the
> >>>>>>> sake of QCS8300 which requires MBN headers v6 (unlike SM8550 which uses
> >>>>>>> v7). Do we have such an issue with vpu20_p1_gen2?
> >>>>>>
> >>>>>> its the same case here, qcm6490 also required MBN header v6.
> >>>>>
> >>>>> But why do we need to mention that it's v6?
> >>>>
> >>>> we need this to be able to distinguish from the firmware binaries which
> >>>> doesn't need v6 header, we are following the same for other SOCs as well.
> >>>
> >>> Do we have anything to distinguish from?
> >>
> >> As of now, we don't. But in future if a new firmware is needed for the same
> >> hardware generation which doesn't need MBN header v6, how would be distinguish?
> >>
> >> So either we keep the name with _v6 now or change it later when a new
> >> firmware is uploaded which doesn't need v6.
> > 
> > I'd say, if there is a need to distinguish something in future, then
> > that something-else firmware should get a suffix. Unless we want to
> > establish a rule to have the _sN suffix all the time and rename all the
> > firmware to follow that rule.
> 
> Currently we have named the firmware as vpu30_p4.mbn (kailua)

V7 headers

> vpu30_p4_s6.mbn (Monaco with mbn header v6), So i was following the same
> convention for qcm6490 firmware as well.
> 
> So if/when SM7550 is added upstream which is the same architecture as
> qcm6490, but doesn't need MBN v6 header, the corresponding firmware could
> be added as vpu20_p1_gen2.mbn.

Doesn't need v6 header or will break if we use v6 header?

> 
> Thanks,
> Dikshita
> 
> > 

-- 
With best wishes
Dmitry

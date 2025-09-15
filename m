Return-Path: <SRS0=yYLr=32=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DACBCAC597
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Sep 2025 14:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 619A3C4CEF9; Mon, 15 Sep 2025 14:38:57 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BE28C4CEF1
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 14:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5BE28C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FDqH9A018220
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 14:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AU2V9v+bz6nG4wcuvjid4r7d
	sbgZN32l7b/stoc5LfM=; b=V3Aamn+XbNINu9wRSiNLelyUKT4QjK6KSgB4+J5A
	w0HIjriHdqp6BLVNjMCA7rQViPfdCnIJ+EuZdBWev07r4SUHKL03rjdJzIee1YKS
	UNXQZR5OFDjve50GHJ25G37RSi/w8LgrHKnipd8Hit1B4u84e+AuBLoO4pte4gyI
	IOGN03GxtL//t+38cx5PtO0CurQG2m5Ggm/fQEQwKUxUWIRJJWa2mkQenCDTFVAh
	72JqxjQDb8IIdE949GVDHp+uVNhUB2JbhucY6xM8yNsVV/+5SUbPDu8j9N2BRZgS
	mDcFqY6UqxMp6wAnCFX+qHEhdMMeiKLo97SBL50heLJxng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u558my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 14:38:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5ecf597acso101113881cf.1
        for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 07:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757947133; x=1758551933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AU2V9v+bz6nG4wcuvjid4r7dsbgZN32l7b/stoc5LfM=;
        b=R2KUk+Z+dmSi0/+txYpbf2/dZy+9ldLsitmVghyIXbCAsuUqoBhmGFSzMtlHx1o5Z4
         A4y7wONgJ64rGNKRhV8zTkbLVJCOtguIYUxxH5kaUxk9ypv4oRwit0aN6a/96RYc57ZS
         LDfNH/Klk5/9/Rf+TUfiKzSBHEN/2MENy2LBV2Jalk4hCQKbxBLFt5Yue6v3Mi0A3MaI
         jsVvAfoBYKBeQ0jMh97uD+Kng4D2miq8L/pHRTHHTs1bgC7OpJ3K+mcC5z1yjXlQO9cc
         wCGIgpXJrDR92P3vg/mteqgkP3gQGlWZ6jSn6x+Xm5ijSaHbQSNJ5FKT2qt4C33XygkV
         bZ5Q==
X-Gm-Message-State: AOJu0Yy6j9EjykKFZ+dzWSqkECEOOgqQe9T1bLuajB+nzU44LWL1me9G
	hXjri+1Rdt42qNfwuj5cx32Yw14RRWg4UJ3cObjUxGjreEz4QoV849TEeVgtnQvoRfkC/joKbxT
	VjObmZPq+r/it4j0kR4PDK2T5Rq3aFiHNe7f8EAY23Pr174od32Qbe4LRge2LZFQjozAWORs=
X-Gm-Gg: ASbGncudvNfJZWpA7dmuLHN55gWrT+MQme8i1llRTZKxU5CIry44L5mj8yvhgGEbXEk
	IXL87WLYClGd8FniLUemQRIoMBrDmMKtPi2mjdPKSY+zYy4VKSM56rLRWnyWGdzcLRZpFrSbkzk
	FbWAw2fG84tr/rZ8wvtO0ju4yRPZJETxaxXJk++8njgQguGum56roOVm/lWJrnMA4hyuL/LrbED
	gWh8PLebCNSIPj6IoIkg7q2w0lqPRR2AwGIxJhu732+X+1qQYgPYyz9AX7tHzYk5kYSPX4I/tTU
	XGAkwzjEJEdKZEZn7XTg4Pd7AK6oVqqVPG+NNbBCoDAW+fHu4pftCTeLFGFSGUlE7ynxokWV5ni
	c1oqyIarrXtHGqxl008d+/WnnyoXWjgZkS1K2+oMVhyBl72nJISDB
X-Received: by 2002:a05:622a:987:b0:4b3:775:ba3 with SMTP id d75a77b69052e-4b77d14359fmr151038561cf.49.1757947132657;
        Mon, 15 Sep 2025 07:38:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp42Ci99MnhAzmBwm8K4DVvgMCeIcaRcRwhyxlqYQ311V8MFC8AxWJfi3ygJ8htXiKen8LSA==
X-Received: by 2002:a05:622a:987:b0:4b3:775:ba3 with SMTP id d75a77b69052e-4b77d14359fmr151037921cf.49.1757947131916;
        Mon, 15 Sep 2025 07:38:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e64fa686dsm3522823e87.119.2025.09.15.07.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 07:38:51 -0700 (PDT)
Date: Mon, 15 Sep 2025 17:38:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
Message-ID: <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
 <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
X-Proofpoint-GUID: JUIVqz6f67Hb9KiyalV_l30SpcGZgazg
X-Proofpoint-ORIG-GUID: JUIVqz6f67Hb9KiyalV_l30SpcGZgazg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfXzGkYSLIXcLS6
 AbPw+UdGaOW+7EjLxF0qbBJ8pnniglCWTg1LkQ9cEA4Ky0vgKico9wGojrsyqMkF2WzBTbIpd8k
 PQW9gesuspzsb41i7SYufM1TDf+JJpEeEk/9zfdu1V4JmR7fvgYqazYzYJKT1NszTQkPmkUOACl
 LvJfojJoGFf+QKZ8YqD9zES3GxlvHjDMc4N7VP4MuUEjPkFyojaIrLQXhES6oIXJFf5/OVnsbNq
 5jH8VcsjgI2SlzSp92dFikVa1/YSzJQVWxdHGk756TdTjlVRzommUQNsdxdDllpxac2ElEJjGCm
 iHivdbaNnJqSH/BSqAG1IKp8vl8YjTP7Kd0GYD9bU6KKsOcARx/ZDQz8Ok6eVoXnGu60a+Alld3
 7YTBsnl/
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c824ff cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=NEAV23lmAAAA:8 a=zNfNzjoQAuDlROqPaigA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031

On Mon, Sep 15, 2025 at 06:27:57PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 9/15/2025 5:29 PM, Dmitry Baryshkov wrote:
> > On Mon, Sep 15, 2025 at 04:44:58PM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 9/15/2025 4:09 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Sep 15, 2025 at 03:40:24PM +0530, Dikshita Agarwal wrote:
> >>>> Hi,
> >>>>
> >>>> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
> >>>>
> >>>>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
> >>>>
> >>>> are available in the Git repository at:
> >>>>
> >>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >>>> video-fw-qcm6490-update
> >>>>
> >>>> for you to fetch changes up to 6313c3b6ec0713d2cae0ac2aed050d70a50526ce:
> >>>>
> >>>>   qcom: vpu: fix the firmware binary name for qcm6490 (2025-09-15 13:44:49
> >>>> +0530)
> >>>
> >>> From the commit log:
> >>>
> >>>> Fix the firmware binary name to reflect the correct sectool being used
> >>>> for signing. Also update the version to add some recent fixes.
> >>>
> >>> Using different sectoosl isn't a determining factor. It's the security
> >>> profile and thus different MBN header versions.
> >>>
> >>> However, why is it important here? We have added vpu30_p4_s6 for the
> >>> sake of QCS8300 which requires MBN headers v6 (unlike SM8550 which uses
> >>> v7). Do we have such an issue with vpu20_p1_gen2?
> >>
> >> its the same case here, qcm6490 also required MBN header v6.
> > 
> > But why do we need to mention that it's v6?
> 
> we need this to be able to distinguish from the firmware binaries which
> doesn't need v6 header, we are following the same for other SOCs as well.

Do we have anything to distinguish from?

> >>> Last, but not least, is this firmware used at all? The venus driver uses
> >>> qcom/vpu-2.0/venus.mbn, which points to the old (non-gen2) file.
> >>
> >> its used here
> >> https://github.com/qualcomm-linux/video-driver/blob/video.qclinux.0.0/platform/qcm6490/src/msm_vidc_qcm6490.c#L2423
> > 
> > Hmm, why is it using a firmware file different from the upstream venus
> > driver?
> > 
> 
> qcm6490 uses gen2 based firmware while sc7280 (venus) uses gen1 based firmware.

This doesn't make sense, QCM6490 and SC7280 are the same thing.

-- 
With best wishes
Dmitry

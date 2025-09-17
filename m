Return-Path: <SRS0=2xwB=34=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A2ACA0EE8
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Sep 2025 12:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4CC8C4CEFA; Wed, 17 Sep 2025 12:41:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04455C4CEF0
	for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 12:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04455C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HBL6p8027120
	for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 12:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9PIEMm+wSeGikKYCyVbYSD/5
	TXyJfJYzkUTpX0fQG+s=; b=K16t5MyJCsxIAl4BCVPJT1NRYuBdYcNLGCkT1wyR
	BCMkQb5earDblBzD0GsbF8fvx28byYDeuCL9gkuDmMAMO1ZrVd0/1rDUSMo4PM8J
	z8m3GCmvP/gOTaU2EALLAknk3Warhn09HBa9p0BysO4WkaoI8v0Bwxgw4FJMiSZ2
	n22/o+aisOm5Tn0WatCdUcBWI5Q5DDuvsX+qavl8qmAcb27foJ6zzS18o9qQ0/7D
	JV6k8+mUR6QEqfxfn5Z+lbazQC62DlBW0F9mLZC2+vfDpg1y30alEx6mvFLYAnTQ
	pIwvi7Ir9ycKd20ilPvQnmMsEoVluilbk2QMAeqx59FnNQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1j88fe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 12:41:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b7a2999d38so66202011cf.3
        for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 05:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758112898; x=1758717698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PIEMm+wSeGikKYCyVbYSD/5TXyJfJYzkUTpX0fQG+s=;
        b=mK5xnd1ZGBIlfV39rMDABQzOSvQCm362K/GmxSnv8AJ3outPx5q/NHWZayggnQqI36
         cKu9pu/6bB3MazcPEg8Tx6mZPGIj/Gl1gPbEOblsaRwNpJ0xnPj9UtRm44PSBBUC4yqZ
         6se0sx1KEt0VAzZi75HwgnbuznwzygOEb8goE3eQ+XfD7V2shLy5zjCiYfCGePcH8WVg
         BpQyYKqCPJkL95bwlMvO40j2OGcqN9qag+/X54cAuAVTmm33efS04flEt0Jyzx2WT3SQ
         lU0kKvgifQHmIn2HJUXfMs1tgNZnBl3k4EXCoythEkDF72jydaea40TLH8o6mwNU/FTN
         7J+A==
X-Gm-Message-State: AOJu0YyNLvfdLCFBs5O7MHG1E84IhzQTS6eqaGhR+JPG5M67uA8OjWAl
	ehbhsQF0Hllqke/6oOpdM33MaGHf08DEEExdXU/KV6TMze/drP+LvdrE754W3JACI0OcrDZNacy
	3TrbxjbT+K/Rebz2rmLalIHRnM1EmglPEw74nmjepiVrpN3O88sOCAAma6PAonGs=
X-Gm-Gg: ASbGncvvCi/5BCcNHmEbUCr2jnVCtcTjoGyX6+NMoh0O9U3sCxBSCN1nBniTaDCmvfa
	KuR+4PZ7kU1N1CHICAWmMqOBAZ1qN1UZVpbbcVv7SGb1+mYXYH6BoidlVW++mTXpwTGw9k5R/3K
	qjfMISC9ycm4/nMK9KcIK52bh9RU+v1dCQMFO6Ak6dzVXpKgEZ3MOJNbxdTUGDVV2pdcuhgBZZX
	fqxiYekAz+a91MNYng2vfnGrj/HXFE11zHDkmb/qvczD+Miqn+hU6iDMx/yF8SyFJsLvVIyphNL
	leRGXokn0bA8j/EP/a5WK8UUf1xp/kytrzZQGg0ixNBlWQSrWRmjMcKWjF2RUll58fcphF0374Z
	IYkXMInfztTesBfqk9MA8kBmQoIDQY1Ukn7nXw9aHSNtDSTOcUPgp
X-Received: by 2002:a05:622a:2b4b:b0:4b5:ea1f:77ec with SMTP id d75a77b69052e-4ba5f71fdfcmr23157891cf.0.1758112897613;
        Wed, 17 Sep 2025 05:41:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC7NiSAi5mmSKNIj0m+fOgw3O2IK8PNnKy4HVAXvLMs3r81orq7jHlUXC6u8BZFjx4XFsCdw==
X-Received: by 2002:a05:622a:2b4b:b0:4b5:ea1f:77ec with SMTP id d75a77b69052e-4ba5f71fdfcmr23157421cf.0.1758112896891;
        Wed, 17 Sep 2025 05:41:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b6167sm5308935e87.25.2025.09.17.05.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 05:41:34 -0700 (PDT)
Date: Wed, 17 Sep 2025 15:41:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, bkumar@qti.qualcomm.com,
        ekansh.gupta@oss.qualcomm.com, kssb@qti.qualcomm.com
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
Message-ID: <5gftkkb4i65gadzrnbzilsucrgcj76jj4ovu5yqt6fzfodiuva@eyctfaizlxy4>
References: <3b566cd9-40ff-430e-bcae-1136cbabdf11@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b566cd9-40ff-430e-bcae-1136cbabdf11@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kBTKQ0QKPTuC1YtsyjixDqs7joYTecTg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfX8xZaPJIeyOZ6
 Ms+26QOc44CtxXuUoBljUVlfklxh0LOGDVsitOrFlxWzv71pL8HkckVHNd9a6b7ZcTmtZMTJt+S
 MdUr2Khi6IvlVZ93v51afDT1gUTX9kqBj+UrUX7qoqwrhbsOrSmHslD8IeH6DsqKmcm27h6g5t6
 tJCHzZrKVebJIGl5N8wRw0zSfjav+jhSfSxKls4DrD38o/QnBySeXCOkTBZUxVj1dxGAbdI1Zr2
 OcI35SDjmBlROYYUkJcHWaMe1QmgbwI8ygJ6JYHJj4HP8DxJc7WDUoLQvsZBUf9QBpuCWGLskPY
 QhrW8DSQbLUy29JS58hEvsRJMzM+oqhUrnfukuKCd6CC57TjW1jxWaOUjxT27lK6LDbDL8oBEuz
 BFGQW+sm
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68caac82 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=xK0LYsFV-NDuc2FG5Q8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: kBTKQ0QKPTuC1YtsyjixDqs7joYTecTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110

On Wed, Sep 17, 2025 at 10:31:53AM +0530, Venkata Kota wrote:
> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
> 
>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-qcs8300_1
> 
> for you to fetch changes up to f504dd64f1f5fde3aef24fcecfc165cf8845b22f:
> 
>   qcom: Update DSP firmware for QCS8300 platform (2025-09-17 10:30:17 +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update DSP firmware for QCS8300 platform

    GPDSP has a capability to support Audio PD use cases.

and? What does it mean and what does it have wrt. the commit contents?

Please. Please. Write sensible commit messages.

 File: qcom/qcs8300/gpdsp0.mbn
-Version: DSP.AT.1.0.1-00096-LEMANS-1
+Version: DSP.AT.1.0.1-00125-LEMANS-1
+RawFile: qcom/qcs8300/gpdspua.jsn
+RawFile: qcom/qcs8300/gpdspr.jsn
+Version: DSP.AT.1.0.1-00125-LEMANS-1

Do you see the Version tag under any other JSON file?  The jsn files are
not versioned, please drop the last Version tag.

> 
>  WHENCE                   |   9 ++++++---
>  qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
>  qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 3080192 bytes
>  qcom/qcs8300/gpdsp0.mbn  | Bin 5832704 -> 5873664 bytes
>  qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
>  qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
>  6 files changed, 57 insertions(+), 3 deletions(-)
>  create mode 100644 qcom/qcs8300/gpdspr.jsn
>  create mode 100644 qcom/qcs8300/gpdspua.jsn

-- 
With best wishes
Dmitry

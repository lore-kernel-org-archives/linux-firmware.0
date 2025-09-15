Return-Path: <SRS0=yYLr=32=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0C6CAC597
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Sep 2025 10:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A930BC4CEFB; Mon, 15 Sep 2025 10:40:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ADD2AC4CEF7
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 10:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ADD2AC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FeHA020502
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 10:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w+QaTjdHjijRmt0FF8FyW0yP
	2cNhcu18P0ov0IfeE6s=; b=G7piSHZ4SwhHAw+2a7nR225XvU8mDszRmrIohgkZ
	7JlMhBiRs1/uTguOujQ8DHweNVhxJcqZ3eacGMMColqc1WNksXH+MVGc17cuWtOK
	9/hMfoPw9wtzEphhvOR49El1ni1Vo/Fyro720cb+y4aKBo11KMD3elKjQqN/TYEf
	n/1gtJp6prxaoOvGaAC6eyGdTcoNZTrbnDInSwPawCFwF0hfCrCk4ki+QAcukIwU
	hPMo0+kBBRxhWqe11wdLUzT4ZCUapLINbeNRhii256+d3R1ZPWvH5YWNZQFfnoUN
	5YAeB6lddQjrrV/X3saIghwQTB3cQ9WfzYwSitcoDyZ8jw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950pv4m2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 10:40:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7814871b57dso13769936d6.0
        for <linux-firmware@kernel.org>; Mon, 15 Sep 2025 03:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757932801; x=1758537601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+QaTjdHjijRmt0FF8FyW0yP2cNhcu18P0ov0IfeE6s=;
        b=dbHQXw1oIyr271cXrdNYJuau8VjeBl/Kc/hYAbRLFVCTfaJcV3YPXhu4s8pFYac05i
         cw3j9NwXFuAN1xwVIAzUbL8/EFA+rlj/LuY6pc1KtUMeZCvuMzya93TA7Gd3HOXKQ6Qy
         mFzNCJxSZ36sUVqiZNXMq6/kHae/mJhxWj0EJp3biAX5jHhclSYFCKu4EAvhUrquZrZJ
         yOrzAF1JxMVcf8qGGSgrurf9IjDpBxzs7HovZEJycbOcVHqWPXCfoVNpKC+tr/xN7S2z
         Rhqg9etVknFxyi5oYZNaMnkObJB4hRsiR7jAZLALPBc8+x9IEk6qCAs6HQbse4HYegb/
         J7MA==
X-Gm-Message-State: AOJu0YwVqoMOaOnr8PW7prWbpbnbZcNvHd+MuymY8RGItVIGekGmolxZ
	Ba+gd7+OZlR4XDXHVy4HiDhjQx4KmnRbsoeSh+qN3PsSdMiHSDYb+JmEwCknl0+MeyXh/MYS1KX
	9PvRi+GxOzWVjl91phYLDAxsD9GaC4y+ltygZXWiOXImFHd/ChSJE7M1lcD88JCc5ZuXqVN4=
X-Gm-Gg: ASbGncuYdUK228E0/7S8A5fVJAubGOih+ZbpaDirhyvf31+jj4GrergmQG1bKWfZaFv
	NDXa8YHFbF9/1QC3LKmaZsoF/YF50V9sGSuayW16lEfGHRe62AybIPB4+BacGwm8+TAMiGFEvFx
	aXWX4GdGInC25cau4mvelEMA8UmgMVcLkgGg38DQAppIRh1dklj9DD3/UJ2kp/LhHxSM0keD7lM
	A5i9SZSqZdUpG2xr9UHEKtMOA5478d+RLn25i4iRESrhLFUGr1Hd11qit9NYMJNWXz1Py/YpxGi
	mDkIFa2js9LhTD1U3D8+AL4ebv7nhM5U4nk6dWyY5hw5ESVuGAim1CAUmtRyOr9n3pqWwBsxCtI
	fyjx3eKslke/KU35o3ailY7gaHu2DwbWGpNlxsnVyw+QH6TwjyAKX
X-Received: by 2002:ad4:5f0a:0:b0:789:798e:da50 with SMTP id 6a1803df08f44-789798edf97mr7302666d6.6.1757932801309;
        Mon, 15 Sep 2025 03:40:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFWsuQMaWS9fV+NAFaW0tcJjruxvEIACZtXIgqWStBtEW0XOovR3DHgnvQktY/aS+2u0BTEg==
X-Received: by 2002:ad4:5f0a:0:b0:789:798e:da50 with SMTP id 6a1803df08f44-789798edf97mr7302436d6.6.1757932800833;
        Mon, 15 Sep 2025 03:40:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57170ff7a65sm2659721e87.12.2025.09.15.03.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:40:00 -0700 (PDT)
Date: Mon, 15 Sep 2025 13:39:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
Message-ID: <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
X-Proofpoint-ORIG-GUID: xOEv3XXH1PuqQLonqeMeSc27oH1DfdkJ
X-Authority-Analysis: v=2.4 cv=PsWTbxM3 c=1 sm=1 tr=0 ts=68c7ed02 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=EU734RJunVw0t_C33hgA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: xOEv3XXH1PuqQLonqeMeSc27oH1DfdkJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyOSBTYWx0ZWRfX5dkDHa+1b872
 o3h79v+4RegMAfEvDV+CyyJ4l9qP3kaZc0A3o1rS+G3XO0J6/qwsRaWa7k29pTrwNztWLgS8z2L
 VdAlmcfNRnYgVWvnumAXOoCZpOvqoouIfd8cuLAbltvmo2PXdNoSzNBcDcCHHPwHJw9CuJ1F7IR
 1FR15NI6fpn4msmuRWHYAEa2K3cCBeYtY67T5zTN7NN9BcZ31FUe9RAqAf4ccJxy0OV8Voe4z5+
 gwtM3Y+SBIwguUyLfVZmvdSno47A3FNbSdQE0xyVbAIhYAdDUpeoi1Nk7MTffjc6TXPpEzfSTTP
 yEViGgcvSmt3hnH8vH0SpjTCP+I8M7CP9Mrw8X598K/KKOBqV9U8Q0Rm475lZIXLq4wt7IEGUNc
 l1nVz+LT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130029

On Mon, Sep 15, 2025 at 03:40:24PM +0530, Dikshita Agarwal wrote:
> Hi,
> 
> The following changes since commit f0f4634972f48c3330896bde5c94557b568a3a68:
> 
>   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-qcm6490-update
> 
> for you to fetch changes up to 6313c3b6ec0713d2cae0ac2aed050d70a50526ce:
> 
>   qcom: vpu: fix the firmware binary name for qcm6490 (2025-09-15 13:44:49
> +0530)

From the commit log:

> Fix the firmware binary name to reflect the correct sectool being used
> for signing. Also update the version to add some recent fixes.

Using different sectoosl isn't a determining factor. It's the security
profile and thus different MBN header versions.

However, why is it important here? We have added vpu30_p4_s6 for the
sake of QCS8300 which requires MBN headers v6 (unlike SM8550 which uses
v7). Do we have such an issue with vpu20_p1_gen2?

Last, but not least, is this firmware used at all? The venus driver uses
qcom/vpu-2.0/venus.mbn, which points to the old (non-gen2) file.

> 
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: vpu: fix the firmware binary name for qcm6490
> 
>  WHENCE                                               |   4 ++--
>  qcom/vpu/{vpu20_p1_gen2.mbn => vpu20_p1_s6_gen2.mbn} | Bin 2036328 ->

It should be vpu20_p1_gen2_s6 then.

> 2031844 bytes
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename qcom/vpu/{vpu20_p1_gen2.mbn => vpu20_p1_s6_gen2.mbn} (73%)
> 
> 
> Thanks,
> Dikshita

-- 
With best wishes
Dmitry

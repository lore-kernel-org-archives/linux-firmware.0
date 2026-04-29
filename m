Return-Path: <SRS0=VOkD=C4=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA9BFF8867
	for <linux-firmware@archiver.kernel.org>; Wed, 29 Apr 2026 12:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8677FC2BCB3; Wed, 29 Apr 2026 12:22:46 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9F79DC19425
	for <linux-firmware@kernel.org>; Wed, 29 Apr 2026 12:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9F79DC19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8ptMD1641662
	for <linux-firmware@kernel.org>; Wed, 29 Apr 2026 12:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FjXKjLwNXyqaZhF8FMX9tWeZ
	eJs3wv2ISCt4biVHnuU=; b=kWj99H9rMC8D80YIkpeHHwi6mrMclPajSo7wGvq+
	zANTUsEM8sUWQ/RFU9dSWEgbt8+orPnVnFdSm7myLduyO0V0OnenoD6oZvVxz9k8
	54JX8rSDgAXFZQpKAN8czYzb6hC08mewv7cPf0QwN05/4UD8xFh71v9U/dnyEuLh
	vleVwUWUFtsMZd5O+FLcEowmeaIzeiGAMjudRMJqu2Jj2Guy4Se/7awc47fyEkRM
	H7/BDi3La5WWXh3TIk66DJN3mleFLbRNjJTUvmrK3D8l0NqDvWZOPhxfX7NzGnVb
	8pHKbOg7RGvVNBg29NLX8d/0++hwSjkrIgAQH74h0BWUvg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj81fnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 29 Apr 2026 12:22:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d84b5f73bso136432991cf.0
        for <linux-firmware@kernel.org>; Wed, 29 Apr 2026 05:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777465364; x=1778070164; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FjXKjLwNXyqaZhF8FMX9tWeZeJs3wv2ISCt4biVHnuU=;
        b=fhUk/B2ChOfB3i7OlkOWoFg3a9slJAqwrv2OB8p/ADb2IN6natt2rBCqqGTXy1IQLV
         +8cIk+B7AhEUGCo1zZw7Ap2oycsCzxr0ATd7mBzu25hut3jy7auMO1nOUlUSVQZt2Ib+
         98iBIdII0QBMuRpzEauPvVL89V1u4fuU3QzivYeJsR7o2sh0sgCNnAqdBWmO1YNaWfMi
         bjoItCXFLalp63kPLzwykJODbL5tf/DOuqTehHSwCcOpOXqSpFc4kMponkN9gdCVXpSN
         V5iQNhaHHeKVeEzTcydElAcwZ+zSN0CI/AHRp6L7bxnkGxHYBOcrZX7D6LZ46l2766zz
         y7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777465364; x=1778070164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjXKjLwNXyqaZhF8FMX9tWeZeJs3wv2ISCt4biVHnuU=;
        b=MJjGoMLqMUDU5AOKOEU/A+8A/ggEhvQLMUVEVRj9WyYUgf2jMWWGYQD5Sg/CDMpUPq
         hSI5UIBzONaClzsunbMpYuZKftwWiz5RiRfI/lOFLtN3wsGa0SgZlmk7Yqeu5Qt3FobE
         4HETKf+bub6AI28Aapoysk6hQifF+zuBKcvmmUj0TCOHmRmulgsth6wRsPSjDARaG6T8
         d6US+AvWf/3rmbfC05patn0BUZP9DWuBrX+9nB33dKFC6cEpwsyNNy7ys0pLvNzEKVu+
         ZV3pepHlggjc/pXdSnhv6QexTDn81i0fy98uXzNXZUPUyvjYY1JZc4tlY/CGGOn+/HG9
         V+tA==
X-Gm-Message-State: AOJu0Yz3YG74N5qK1u8ap07+vOC/Qap3hVqV1CxGdi6CPqHVR1ftn1dE
	npdnZq2hPA6bhYZ8eiyIy3PnqZHqcIIqd5/e7PzL7XDAL7mfhf2CA0IYfkvVld3kyn2zNC2sPAL
	JrYjvJfNEgiAMz4cnI8nR3g8vlaE24lRs/d5ZBVPYMrIIx5vvItMCvIGHmNDxpMs=
X-Gm-Gg: AeBDiesGqX2G/F3hicmBbnVevb565ETOFs20+3oLNWr9JlXp6BlwFDRjdmGIZ8lYjR2
	xQ09vgmsjVkMQNBSON79bXzwlj9tVeWoLkgfpgPCZBnM2UUgtGGhRQw0rdV7jte7ccfxTP12Ez5
	CQXMHCbhUdlIbJTrxeMDVCsYyfzbITghdnS1hqqe+oeyD1GmCVmIGzcYanaYx1EyvAGRwPnrzK5
	RVjE7v2eagqXP8UBxYqqXxvVfagUfoJLasZsR/LwKtOgPDUds2a56rk5REVlW4zZhM5rBUnA76P
	HP8zIpntvcjpegwv58NUbooL1io9OlWv78gAQaPHNrRV7Azj9pZvSCfBCnVP+hq5EDQqJr5B3vg
	bmbNtl0K9dh9vnbrfpYeuy952Ox7iUgC8UpYd4pn3HixQZvdbpgXipQCJH+3hV/EmheJ008s8GH
	FHzaHEw/4+ipLXEpyasie5oK7XC5a3IICTZeK8qREdQ/Ohvw==
X-Received: by 2002:ac8:7c49:0:b0:50d:9cf7:18fc with SMTP id d75a77b69052e-5100e0f5110mr93762841cf.11.1777465363798;
        Wed, 29 Apr 2026 05:22:43 -0700 (PDT)
X-Received: by 2002:ac8:7c49:0:b0:50d:9cf7:18fc with SMTP id d75a77b69052e-5100e0f5110mr93762451cf.11.1777465363339;
        Wed, 29 Apr 2026 05:22:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a763378sm498785e87.61.2026.04.29.05.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:22:41 -0700 (PDT)
Date: Wed, 29 Apr 2026 15:22:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
Subject: Re: qcom: Update CDSP firmware for Kaanapali platform
Message-ID: <pagwfd5wvz2fyvajpr7raaobruswr36up27u4nr3cm4y6aiyc6@dxqqho7ou35o>
References: <bdad5aeb-54b4-41c2-953c-015a826dbbe8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdad5aeb-54b4-41c2-953c-015a826dbbe8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: r0XCwBhq93FLC7Um-paFl8WLO3M3Xvz2
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f1f814 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=2p5-y9eUhKXWyglOz4oA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: r0XCwBhq93FLC7Um-paFl8WLO3M3Xvz2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEyNSBTYWx0ZWRfX+Ck9Jswdlfg6
 2fPNugBBhJ6AhOdrmsS1bgycLTFkecAObIQqddKmWbbdgZAOOc3bXNj7ryDsYobIWzzpO8fTnk2
 vMBahlLdp5/OfaqJ4IKYwo+mEWErKFfBM/JBgP20j6tH/pVwyRtDYJtgdCTh69jeX4Q1SuGELC5
 k7x6eNgL8xu40TrvNOh01JF1RPpIP5dKgAnjnpmAx0D8LC3/72B0Q/Sv9Ln26WTEmnLzQScTDwz
 shvg4KlfdV4+VZGS10RTDFp+qhzpnsmz8vqXDqWci7uIkngW0nCzt14T1VXKeTfuAABfoCl1X67
 PiIveiw9RcIMNsYmFs+Y++ZNtrlUqNpSOuV68lg0/1qzAn3bVHEibckSD/zA8fsXcdZXSK+zh8D
 PtUDnMV7jhAaVz1MtNnQA5JMCc+YrPLF5SUWcS8bjKsGkVwwVkTGOQtfP2omqKncZYgDlv6XwXa
 mApdI7eqcVg++pWtpOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290125

On Tue, Apr 28, 2026 at 02:19:23PM +0530, Venkata Kota wrote:
> The following changes since commit 40a3a8bc43b7f19bb22481947080bbdca304b4d1:
> 
>   Merge branch 'robot/pr-0-1777357217' into 'main' (2026-04-28 07:31:56
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> cdspfw-qli-kaanapali
> 
> for you to fetch changes up to 0cbdd055b0890a7c928a1e02c615a650df38dc5f:
> 
>   qcom: Update CDSP firmware for Kaanapali platform (2026-04-28 14:10:31
> +0530)

Merged and pushed out: 

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1025

> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update CDSP firmware for Kaanapali platform
> 
>  WHENCE                      |   2 +-
>  qcom/kaanapali/cdsp.mbn     | Bin 4960728 -> 4968920 bytes
>  qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
>  3 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry

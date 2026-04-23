Return-Path: <SRS0=XaTs=CW=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169CFF9935A
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Apr 2026 09:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F4126C2BCB5; Thu, 23 Apr 2026 09:43:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 356FEC2BCAF
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 09:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 356FEC2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8trFu028821
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 09:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qlZp9vUPRbY7QC4wtprpm5WL
	A5cY8BiCQUGfpRRYc5A=; b=igq3US467B+NRB8kbYvv0KN0Fm0f77BLF62bWcZr
	SqpKLq9sow9gZrZN8Zrzi4n5kdWmDuHIPr0c2cbjBrbkfcewLOoQlOBVtQ/gR+ls
	Q7nu5x16yEfwqu0OBkSbZVXim8ajCSJWn4QYMSuYVrbHe4uXdqaaSlVZl0RbFkDK
	p6DZKaZpd6S38MUXA9qWXy01+qVfLuV7llKZGEEKAVrbsR4phLsrVrqLjWlunL7I
	uwi8CW0CC2b11bavqL8oqfxvnVklfzTniW3zot1wF7L0DF4tlKuUB/e9vRHkEx2B
	Jsgz621/XRxqEiDtWRGsymbtsTJ0SAZOebhWwu8ujiEAaQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqdjm0v48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 09:43:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76cb2dce57so3913467a12.1
        for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 02:43:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776937386; cv=none;
        d=google.com; s=arc-20240605;
        b=M0tv9kkKT2RKdkjLLK41bFgK/h0mMMeN0nZiXuxGxaN+Hq4MY5pnL3EBCpCJvQpjTM
         FYTQEWEor6z1YqFVB4gmsze0v9Z0NMPEUI+F98kOCOwYwmlY35jv8Tr8WKh81BGF8inJ
         DCo0R3M7udFUWTW+acO/qTK6rYNKNeKfx3NkNx4xi5MYwXK/38x6oLydN/KekxEhWRcH
         UDNnVMsXpPrTJNVT1+gxdtfiuBRsy3ZUYzmZgVb6AjYYIyxLk+yCjnz/VRmoo0DdtpBp
         mVGpFQ/wOeypOZW22i+W9y8JhRvxKFLXyB8IBi8HPHfOV9gzqdEqNOLE6pMIviB1lhsV
         ltlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qlZp9vUPRbY7QC4wtprpm5WLA5cY8BiCQUGfpRRYc5A=;
        fh=0hZIwwxU0IvdnU3puZRSUu8SPP/I17IT4iH7elxaJEY=;
        b=OW6rFCehPiAZt+WIRUtUrg/HdAkSrwo0F9Gr6TX1KN82lTFxXYGFFPkPAdcC5H4KEk
         ItnjT5Tt3AceOBy+ip9ChxeaUhySIyb/4N3SMpLBBlV8r2ms2LHXbAWt1kxoX7I4tnMs
         rGQKjhcgW8FOcIhTnAh6HPlnB8y1WsdCO5c95F+v25vNgpsmTT8Kn+BbI3Ji3ZTgjH7i
         6MWn+Qm6JSEmZI3cSmfeI+LwnzeFgVrd7a5PqSExkj9Ja7T2rdBwLCa2aVCXFEfCcf14
         RbqXbNhVky3+WZycL6lo+R+OF8uYFkVMtnpfMQINk7mM5BHy1+oOrTSlN02h5Q5mFL4T
         GWKw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776937386; x=1777542186; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qlZp9vUPRbY7QC4wtprpm5WLA5cY8BiCQUGfpRRYc5A=;
        b=kKg5K1Woss+/ZbwU8Uo/jIpu3MdxANmuFJVBjPqUayLxPxeJCFm9aN8IhPtlnK1w4M
         CvwJzN3UY4RUqG2PFRaLTStSm9qtF9BLGrMwGXyuaS9Rz2Bjb+ifTxDXYc+I4qF9QOYN
         wGlDvgEhscrTvymzTCAzx73PRBlTq3E6T9PQla7q463jcDPgEEyTR4yXV3od5kTIuOd1
         c4TA+DfnOGrs+pmgHM63nDTW27f5b3AKRSyz/wodywYRWzX95H1ZigE9tRy4ZQWBBx7U
         0H7gx9rnjVYLUU9aCGuCkE0ew3FIwNH1KUkB+TjYPyBu1DT41wUC2+dJrEcVnjocg+C9
         mruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776937386; x=1777542186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlZp9vUPRbY7QC4wtprpm5WLA5cY8BiCQUGfpRRYc5A=;
        b=YCASqsVSsGNaPGoEQLcKeyCsJt8yUDzMzk3gQT4mIk3K9fjmSh2fN3QIQ5gypnsVy8
         JKtD9kvkaKUx1zzNdRvPcevAF+7DkdNzjndfQ5KX2Xa6DQ7CUDHeycammyKPwowKBuN5
         Sovz9UFKEjpHtyLRBcUJbEqiwHqGgvITUUtdQAmqVpx3kk8Lc+U9StvExOPSuzjeNAuy
         qtHasQJp2R/Zy0L1BvEA+HNclrnVQ1ZK4hqG9HaCW1Zpt+ktd0zyXc592FxD3IsxY4u0
         nS36szagF36AEdkR8pkvCRwmxVJSdo9YQDempI8DjS8N0NdME6sOfIHsNL1ogrS8Xkod
         GQfQ==
X-Gm-Message-State: AOJu0Yx6x5g69EVBiLNsClzDxM/PwoMH1D8weTgVeRdguiHRJI5rImPG
	R3ORMwqaZoREJr0mwYkIBaRWbqYjhU6fEDxFgqPa8NtFSwN9MLEA4o8/+6zbx6/z6D+0MqMW1GX
	LT8QgwbOc9zhquGquUmOymJlgkPthFuoLmEQpynzoSZr1TIiuNcYvaROfjTy7WTbgM3h1kAibe1
	NbzaKW/Wpmk2DbG6rW1mdRvSvZQmCfJgy8S298ilFS+2VHjLcw
X-Gm-Gg: AeBDietnX7fdJrk6WLcJCQNM4IBYZd8G2ET4ilWA887XnCcqWo9Uhbyo2b7Blo1HJYV
	nmnXIbZYxxUFpwh2orx7Qg7+5+i5ZxW7zbdGrtCzyDUc9Rhxr+TD4IMQGZ86gFSA9LdYSURE2wo
	Q8jFI7T/IlfvJZF6gv52pScCNKvSa2gxSPYBHqfliboKU6Yjf0WC6bi2saWqmRn7kx2b3htwIxP
	soCNJbIt/EcQGhmnQ==
X-Received: by 2002:a05:6a21:33a1:b0:398:71f2:59b7 with SMTP id adf61e73a8af0-3a08d8a7b5amr31534684637.33.1776937386208;
        Thu, 23 Apr 2026 02:43:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:33a1:b0:398:71f2:59b7 with SMTP id
 adf61e73a8af0-3a08d8a7b5amr31534655637.33.1776937385731; Thu, 23 Apr 2026
 02:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <4a5c724f-a593-47d2-a271-367fed6fa6ad@oss.qualcomm.com>
In-Reply-To: <4a5c724f-a593-47d2-a271-367fed6fa6ad@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 12:42:54 +0300
X-Gm-Features: AQROBzBr9cRJ6sosKCCTfHMnu4354gqDGE1Lvf3wKW8TvBhanx9i8Y1ZzTvD-Oc
Message-ID: <CAO9ioeU=7OQ=NrP704hHus1FfHdZ0DUx=y+byJ7CPL-BZuH_=A@mail.gmail.com>
Subject: Re: qcom: Update ADSP firmware for Glymur platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=EZn4hvmC c=1 sm=1 tr=0 ts=69e9e9ab cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8
 a=BSKm3JqdhvctVEe81esA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: gI_xIRs1UsuHa7MHvhAELBHNlOaP-DJv
X-Proofpoint-ORIG-GUID: gI_xIRs1UsuHa7MHvhAELBHNlOaP-DJv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5NCBTYWx0ZWRfXxx4rEO6nR7EE
 v8pqNI68xhaOm6mBa0WRhZKCMOsDVjXL5twzdR+Jwi7gBEM5bmgmucq2rqqLuJ0H06u5zrtnrCj
 sw3E6Ozfe/el4y3SN3SmvaRlPC9BSooaLrSMXU5aPHSxkPXFg6iq7Nk8FJPqiTqUURKI4NDiBiW
 lFB1RVjhXi83yxoaD/rSijXsk8RUXFGYcsJqhZUKxbVr2y7DpKsi8uuYIi57yCVGP7EM+hJq0Zh
 VG5AITdYKH//Z+5A+d2HD1Tx7r3nVRy3Dv8foEvWK1IGf3XU50s8A/xrqHd2aDrQhHaCZc4QiL+
 4mvT3OpszLY49NMlqbd0iH50BoTrQMEIPINJ5SHcGfDIoEP9tMAFanxpZ9tzIkY/mdq6QtX42Pg
 SY4rMN+UBWs9omSbOAykrFQp9nZ3QfyGRBe1MEk4r5ai3/Qkj8xjULkwMU5oc25L8z08SEq52AQ
 +yknTNRGZ6KJ29oB7iA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230094

On Thu, 23 Apr 2026 at 12:34, Venkata Kota
<venkata.kota@oss.qualcomm.com> wrote:
>
>
>    Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-glymur
>
> for you to fetch changes up to 4a74616a3522816f6f33297219f9f27cfa4e3268:
>
>    qcom: Update ADSP firmware for Glymur platform (2026-04-23 12:18:50
> +0530)
>
> ----------------------------------------------------------------
> Venkata Kota (1):
>        qcom: Update ADSP firmware for Glymur platform

Thanks! Merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1016

>
>   WHENCE                   |   2 +-
>   qcom/glymur/adsp.mbn     | Bin 18622472 -> 17049560 bytes
>   qcom/glymur/adsp_dtb.mbn | Bin 233272 -> 225080 bytes
>   3 files changed, 1 insertion(+), 1 deletion(-)



-- 
With best wishes
Dmitry

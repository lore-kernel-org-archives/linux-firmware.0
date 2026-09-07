Return-Path: <SRS0=GJif=G7=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13185C79FA0
	for <linux-firmware@archiver.kernel.org>; Mon,  7 Sep 2026 12:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D97741F00A3E; Mon,  7 Sep 2026 12:33:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788784424;
	b=EnQsyCsYJtDZldvTrSg37qQUpp2Kcm/EM1p/z+oamXucmHpELke1Iofn9tAuDMqaFFRx
	 V2S6RjEQmlcGJa8FGioJnadT9jspiGDsAHYiKV/0OT0/ks2v0hs9juL5AHEZFmAbiBqcz
	 F/RKIwkQovhaV3YOgUSKCE7XCpx+lLNJ/rzNeD0RKP2IwPcYigH+CrYCCOs8sqxGCgW/J
	 oZhoM6fBnqgutvccwFPvXOSI5t2QvPqfsacvo1w3FUC2HDnQI5PpYFIrSGXHb0f3CCHhk
	 I+VNydAmyd7SZjOZHZcGPS9pCQkWHWOvl5pDWEK3IpuY/Z8qrd8DNRPuGS4cArPxSTA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788784424;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7FaOY8f54FtSh37ziIOcdfrVMHpxw2IKZHjibYZJ0qk=;
	b=0ZWufqP0exvHJ+gIXkieI6cwxYC1n3GtqmgLRnXNjzgzymtr0llJPGe0G430CknyLFhQ
	 qU0J56/f4I1unoafrGO3t0Jifi6QTYQRS+xxIiyz+IchdhMUsDxvk0Zd9J0Kci9o+f4z1
	 v1N3uJIjZvAf9dxOCh1X5hMlZkbD3OY5lkdxMiHRN8jQaFZog2o5hT9/XJWUlD34y/cM3
	 d81dsVvGnfZhDbgETacT4EBTAl6ASW/akZFo/M+gwcYOsiH0MwukbxWMyCGrOiOgvVrbb
	 Kls683nhm/yYPYnDBM0anOsqZLgOv5wF9Z5jsBztOJMxQktkQS3dNvW0ZXQdLpz8MVQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A04e0UT0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bNuwkUi3;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 365471F00A3A
	for <linux-firmware@kernel.org>; Mon,  7 Sep 2026 12:33:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A04e0UT0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bNuwkUi3
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 365471F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmwWE810024
	for <linux-firmware@kernel.org>; Mon, 7 Sep 2026 12:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7FaOY8f54FtSh37ziIOcdfrV
	MHpxw2IKZHjibYZJ0qk=; b=A04e0UT0igPNwknODJhaGqHIQfS/6AcS68LftaC/
	Yi54V50mqaKEAvXMK09+VgF+cBUJ0HhO86aYMpGoQTaWgwaP3I2xg/3RPA3FFW5X
	MVngCvnt/bvlJNGzUWftiwEzhIgbP4X7NEnCH47yHbAjq5juz6BQ6wYwUfU0DVoR
	g4JSmYLtMztjJdYQHO0QESOEMKeDqZbqcxu0OyOzsJTpF4w78CznkXBNhV7wuVns
	onJ4ogAT7WrT5WcFJ8ERcmevGgkIHNJIvKy85alsWoTUW5vlG3qoPI50ITRB+tP/
	BUhwNFBcveBmwZHgFM6+75fGeyqh5IpcD4mmbMtGJ2Hagg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua9ct7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 07 Sep 2026 12:33:43 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c0fb008616so3764847e0c.0
        for <linux-firmware@kernel.org>; Mon, 07 Sep 2026 05:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788784422; x=1789389222; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7FaOY8f54FtSh37ziIOcdfrVMHpxw2IKZHjibYZJ0qk=;
        b=bNuwkUi3DzuAuWnh3+vXcZB47rIlEe+4DKzZBMvI9i3/IzcRx/mgoeupgBJGDn4r4J
         TShliRJ/H8jZ3GIHUULIgOjJBuKAaMiO91bYZRrQjqP2gJ/v3ZXP3X/R8Obw/Cl51ZEH
         /N6YnxZANJ6woyMWxbzpZPKFCKFoaXfZMnOHP/KBh2ZL2a5RayVnNHflAbcpcSgaE8xb
         LFbZs7nIj6VI14bWKG9pzpkSPDp9Wysk0SyfYfsc5+DJ0Jj6YCK6Sv9Sununst5lEoOK
         hbMjR8YOGClHvynxOrKAVjHZRft7nO4D4xNQkMRlP/hbuonA1m3rAH6rZpRT39SMmf0F
         y6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784422; x=1789389222;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7FaOY8f54FtSh37ziIOcdfrVMHpxw2IKZHjibYZJ0qk=;
        b=Gdxa0LSJ0VkXWJKxIS/VtWE+L1lzT1x0xs+9Jg4CdRDqG+YPLXFGlEuOP6c3rMviXx
         rKdzPn8/SfMSPAm727caGr7r3DQIUczgcWVQrLJf+zMKQ5H11Xz82QoNCmzFcnF3DOXy
         ffBm9xK4QZ4ULKDV+rW8VaZNowYr0Dc1nkoMHU4L/L0J+rIrE8ZgeS1odgMesowl04D2
         /bIGOp7wXyks97BpHT/wNDngO8o83HTrBrPR9yvd3B8VoBFYchFtiFl6QwFemly2CKH0
         pTmieS8o8PGAnrRC0ubkflLnFqdTueefYo7NWnCaKssSSm1mK0pTMyZWn1hZ1KV2Y6oB
         Tplg==
X-Gm-Message-State: AFuF++knQE5td+wrwe41oatG4qx9WsmeiSLhxnVA+OPVrVJOYhsb/wIZ
	AZphtuXfV0iG2RTZT/vTbKcu55EPhFW8lVTy/bUBMYJRSRFZ3UmMcaL0n8O7YVvy7EtYGrmNAVh
	0xy39cNdA/Yg4uy6XKwKz27ceqsBeopfwNl9E5uwDSInLx1H/IaRwntStepUnqUQHh3DBfZE=
X-Gm-Gg: AYBFou0+Dp6w+GwoM99YVmS7Xh+2utw0YM67jFy72oja9gZ9mQzT3Gu7JbenWSmrz+0
	wDPOJQLc33nFqtW9HCPvwZyE4icz1R7MtFcmGcR2QjTTENqXAu9pZqIY++nZ9qGxU5Vf4c0SnS1
	9voEQ0M20DPKXBYgHhX+XZgeVcYGXJN2WLGPblKOW24Ce0RB2C94/Y2wnAmAyMzM6d6wb8I+URD
	BJqvuO6NL6g0Yt5T1McbyBS9b/49EbBpbF19h6/bB7A+rRzka8sMzw5XzCjWoiSdK2605UYac2i
	TyBZTu6SG+D7Yo2B1C3Vzw938Dil1X6GBdK9hJegiM+YhKmhBs7Zs8JuvBy+haDngHZMe1ZAEBh
	zgLFzFGjr5ahwiCsM9WJTKVLuDvlONXVPPTzAMLbbLbupjSiQ8tdklqt/zX1Rcf9HemW/MUTqEb
	Qzs4l21XH7HtHh
X-Received: by 2002:a05:6122:1d8e:b0:5bd:b0a7:47e7 with SMTP id 71dfb90a1353d-5c81a857308mr173027e0c.3.1788784422363;
        Mon, 07 Sep 2026 05:33:42 -0700 (PDT)
X-Received: by 2002:a05:6122:1d8e:b0:5bd:b0a7:47e7 with SMTP id 71dfb90a1353d-5c81a857308mr173020e0c.3.1788784421961;
        Mon, 07 Sep 2026 05:33:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3d47ab069sm24695961fa.4.2026.09.07.05.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:33:40 -0700 (PDT)
Date: Mon, 7 Sep 2026 15:33:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: Update ADSP firmware for QCM6490 platform
Message-ID: <xwnidpg3lqkvzjbzfvu62nrojk2ermgeki53gmb6jd24voneju@5ternwibiihi>
References: <91a07f84-e757-426f-9ce4-92d5b7af0d2b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91a07f84-e757-426f-9ce4-92d5b7af0d2b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YWR9lRl002Sd6pmfhNDPZvy66pp9T6j_
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9eaf27 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=C5mNPc5nWw_qRLBQ1TQA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: YWR9lRl002Sd6pmfhNDPZvy66pp9T6j_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzOSBTYWx0ZWRfX7uz8Y8o5HYGG
 HZiDT0Tl1NyO0GzPv40BOHTRfGUti3v5lIYNEzsDYguDD9HWJkEjKlJ+b4FB/kOnAtLshdThwvQ
 zJelRXat5YPcVcXtqHpeSJo4J94Pqe0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzOSBTYWx0ZWRfX2eRyrpt0fAAH
 ZX2xhMw/Ljc73yIpScUc70qD5SM+/xMDf3srAngfbHwqxhlZGZqU2nuMGnr0KbS0NxwGGJuJKPb
 fSOtQM4xtY1qRg6e+gWbwqwfSRzRpYJs9LltCURyVKS8lriYS6PN4Oev/IkwNowgb9jaZmCVOFf
 hnd0TaxkRqAIZklPyDVtYvEQdcN3mN5o8LPaBIUGbx7vVeu1LfKsbCA895qiTWgI8r5BeJ3w+6l
 pzS/hgjtnC75k6UXRyprSLrQnIb2JqXfF0K4e0Qi44GZPCmGaZxHe9INSvyz+3YH5XyPENDr7kL
 +5aWQWtUZZSNX45ED7wgbRwNhLuSxCR+OJtrx9Iy7ajDL3o3Zm8nQbZ/qknB7YFPXbjX0IYqgSP
 AAEeZQctmiv0pyDtzDIJgo+WaQqJvXRyoPma/BVqiCbP6fIaYOBHKjnQJunFvv/R2N0D/YwNzyO
 4WQgjXnnbVT4gAxJbEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070139

On Mon, Sep 07, 2026 at 03:42:43PM +0530, Saddam Patan wrote:
> The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:
> 
>   Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-kodiak_256.2
> 
> for you to fetch changes up to 7659e3ef97b14fcf3784852b53ac4cfebd3dfbd3:
> 
>   qcom: Update ADSP firmware for QCM6490 platform (2026-09-07 15:39:04
> +0530)

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1219

-- 
With best wishes
Dmitry

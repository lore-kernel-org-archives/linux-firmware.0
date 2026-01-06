Return-Path: <SRS0=NJ94=7L=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D454CEFCEC
	for <linux-firmware@archiver.kernel.org>; Tue,  6 Jan 2026 19:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5BD08C19422; Tue,  6 Jan 2026 19:05:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C9F4C116C6
	for <linux-firmware@kernel.org>; Tue,  6 Jan 2026 19:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C9F4C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606CAE2t4048526
	for <linux-firmware@kernel.org>; Tue, 6 Jan 2026 19:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PnExPef8cl/W7C0NmYsrDUDP
	tkQ5SmQs4VU42ioQmqk=; b=C3a054qM8LODfGtLZD+57WqS3eIH7oXSdPPghxd5
	UotksFkshR91fKLHfFh033KVU+/kWbj9eVnbLnN612DdvW/tHUIXTYeA7gF9jcdV
	8wI1odCLe5DixtvI9iUSWc7D8WnW68SB/S5Uvb7ahtWHiYq2DXdeaZ02AYomc5cd
	DBo6tL1pfsKj+OUtGXNTJarClZCXK03HFPdO1mUqvzOMNQBWRtn3dr3IKiAtHpnK
	xUgocWHEc6b5vn27YQ8eLYWk6a8261YTwR5QYikajjFvdt0ff87NgkARzSHFPbiU
	VtpvsJijmjV53PHJ4ducGOqkTmd6QPw4S+ByeHm4Wsn/cw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh25rs8g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 06 Jan 2026 19:05:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4a92bf359so36154551cf.2
        for <linux-firmware@kernel.org>; Tue, 06 Jan 2026 11:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767726341; x=1768331141; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PnExPef8cl/W7C0NmYsrDUDPtkQ5SmQs4VU42ioQmqk=;
        b=KWA/OfSHVDhuwXptKsQIc+K3desen7x06zaHB+BMYjj4Cpx+fS6d5AHyo6UQXa2qCH
         mPLPvjuTnqqJQH+5SgLzzRUOw7wZje6KCKcP1nJ7ruI1wN/JgPMBqVpCe2m2zSFW0DfK
         QzpiC273Y7D0mZ/jb0TyUHW8meuaLUMWwaL/ucRcrV1+S+Ya4h1Yq+vBZHrhTKlMflej
         aaZ2fBWPQk5oMxesP1CCUDYqPMhndh2a3UXa2Su/5Ao8Qx++w3XcFonaCzsa+Z8olG5O
         CT+mDEYDZQC93CmTdNPrsAgLdXe65s/18GkhFTYXE3DUunRppKkusajYTaACYAAkc2EV
         huUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767726341; x=1768331141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnExPef8cl/W7C0NmYsrDUDPtkQ5SmQs4VU42ioQmqk=;
        b=nSwXW6X18SMyg0TfL0cMny66J9nbnpOUyEq1GjJi6suAnUNc/NBOVYEALapjrPI8gn
         KfJ3ExOIPA1GulYYDAQKf154LDd93aoqy78VplJMJoJ/581UoOk+tanUCVYQYAL6I18c
         6hBH0gIMUUQ8VJjpXTq/0Tdk5UbvVTsV/s8BMwP33bhLIvFk+l6BChw0lH0lVvB0YRTD
         fLB/c82D7y/mzl4xgSDOXbxU/wgOSewGUi5E0EG4vLG1qniyiWzfX1x/VcXWPMHO+cU/
         TiGuISfHn4pvmvp7YktmRaCJd7L82Z19f/OR1hOEdH+GofN6Ctb3zkB3XWfJ0ePNbRBw
         Ry9Q==
X-Gm-Message-State: AOJu0Yy6ocIcA+GLMC6vYPybk9B249ogcQjhWDkelqNblaGo9kmnDXRE
	rjHG8A76i3gyO4BviCD0vARVEtca343h4LQr+piw0l8PsTjdk4XNBm/70QsfxfdG2UThvm/ZAZh
	Z+IzOch0KyqyLdawphbLQgIkcexDVbU4pe1YrNy98CSpOXftlcg/O49zJmdtHkbI=
X-Gm-Gg: AY/fxX4PqrCzYXpJRe0bxbB47fpTdYkG7nJ+zJGvB+caxzbq9/V1uli0o/GR67ai88z
	JZ9t3imSzVjNLLAxXZmHi0AqNygXZkW1vyBVZaedV52zd16lZXXoTujLqdi5OWpPGWayO5e6kb2
	zv1OrT0QIJWjjtOeWg2fnJCJ+F2rvSKMVim4lK3nfKnKS6AIGd4nRD/4a2KxsubLzqprRez3u3O
	S7VHHS3HVThtL+lraRh6ROSgEDttD7RrGIGAOW8ddBFM9e2BpN1bXfRKX8SWefog0/FXElODoNx
	SmYp6ungm21xLmpGjVxOAWzSXAQ/NjPhtbxBpIQf0vTGKdGnS+NAbSb9iVLEmsrWpiSntQWjJOM
	zJLPuuJrU2iQE7nwzkDaZ2XjKz9tq76KD+o2SiZxQTTiiYUXasyYNS90xLWoKotRPSNli/bhQXk
	Q6J5Y0KRUz2r/l9BxCH5UjWMk=
X-Received: by 2002:a05:622a:4184:b0:4f1:b9c7:18e7 with SMTP id d75a77b69052e-4ffa769902bmr53511721cf.4.1767726340568;
        Tue, 06 Jan 2026 11:05:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVpXiBpqgf+IvbViiedT0amY3frlnLBZ1F6bvBA99wLJJveEExSGo3UHoQQSia6uOOo+1k3A==
X-Received: by 2002:a05:622a:4184:b0:4f1:b9c7:18e7 with SMTP id d75a77b69052e-4ffa769902bmr53511181cf.4.1767726340003;
        Tue, 06 Jan 2026 11:05:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0d22csm762779e87.37.2026.01.06.11.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:05:39 -0800 (PST)
Date: Tue, 6 Jan 2026 21:05:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PULL]: Update firmware for Qualcomm AIC100
Message-ID: <7bng2llowofthbhuagrwnmh4mt2xliudmtyjfinmd6pj2i4vvv@sigtzabqdeof>
References: <8ada0f35-9663-4932-b7c1-53c00f3cdf92@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ada0f35-9663-4932-b7c1-53c00f3cdf92@oss.qualcomm.com>
X-Proofpoint-GUID: LbvpD42GqAKLjz1Bk-7OcxHlyDIPVDE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2NSBTYWx0ZWRfX7jWyMYKRuyG/
 AbWKJ/EmhW+qKlhVAE86ykT48x3fu8Ukwn+ARf6AM74iCLBk4P5scpyr5FO4mY9K72bLFLvj5sC
 xMtg9AMap43eDImVH23BBFiIZz9/xviYlST+qVyv0JqUKHy7/RZEMhwm54HAiDN4sslNBv3w9tq
 GO8Zcv8EBc3uCreGpjDPamH0HCm9NEH7TwZ+7ag4JcDP3iJ6JWs4UocfN1YtUcxviuktidWUYIp
 WDVlK3GFAFL5DQu9+HohWpSWATaWTumTcnKvMGqfhtC1Q5u4VymaTykIFOZJQ8f9zL30rbJqVxg
 ipgz5fFEVFpvQmwU7yCdYxiO5/5Vy46+MkQYlcT1UzM8TLF9qOl8BdSPtkroN7TDgos04FCKlG9
 t8zberPmDTT99GVHF78eaSnY1J+rmzf3SgthprXwLTleE603IeftBfiE5zjx0joKUxWtRs9aT0T
 z/uEG9nylXpBmbp96NA==
X-Proofpoint-ORIG-GUID: LbvpD42GqAKLjz1Bk-7OcxHlyDIPVDE-
X-Authority-Analysis: v=2.4 cv=G48R0tk5 c=1 sm=1 tr=0 ts=695d5d05 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=SlpdmATz_RgLBfTfWzQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060165

On Tue, Jan 06, 2026 at 11:39:50AM -0700, Jeff Hugo wrote:
> The following changes since commit 61a76356fe7fc29479fef362abc1f47bb40eb52f:
> 
>   Merge branch 'upd-wcn6750' into 'main' (2026-01-06 15:37:35 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/quic-jhugo/linux-firmware aic100_1_20_2_7
> 
> for you to fetch changes up to 3ff97fca3cccae8c68b14c3bfe9785f25287bf1a:
> 
>   qcom: Update aic100 firmware files (2026-01-06 11:25:03 -0700)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

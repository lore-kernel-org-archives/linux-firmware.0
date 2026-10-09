Return-Path: <SRS0=1Q+e=H7=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66132CA5FED
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Oct 2026 07:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 51DFE1F0089A; Fri,  9 Oct 2026 07:43:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791531795;
	b=guuG2iWxeiRM6B6bm4vAyURLaD3OkIxRx5GOr8DiDYLilwULKivZs8X775WfoJaFUCVI
	 dYqXeffD4bsLC4D11G47j8vHt1Ol35FlPmHaCy1Reazqqi4+kVc9zAEm/JqbUbuQ5CUtB
	 aNP/IZ2m1kG9HdaKYhW9HlFeGK3ZMlRY8oK3tNGEVWOj1Dr0NN6XOY9HpidYQ31EdDsjX
	 lcIcVSfNlAN1uzlxYyR7Dli3X23i/UWB7empBVpmx0nBnY/G5cqtn0Yhko2APqO4YjWDr
	 lQ3BKiWZ3pfq8e3McsAAliB7Q+pJ3wVQllLoNl5ypLl0Z74SGsQNRxOKZq1X/SPKFjQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791531795;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fPHYuMsJqygwwrWIsElqR+1NaiINEfs1cFYK8HJY5gw=;
	b=F/H7vmDXItpPYhZZHtZOgi4IwPd6BVk2V/kykrJKQd1MG3bqIUe/MaHA/JC6Ox55vmNl
	 d0juMxjBVXfqphYtElvSsIsahoo1Y7q5UqS9OwTMjnLXbPMTmVeqLIpM6h9r9YKzWCSM/
	 F8J5ifpKj7QxH5WqHuKhUGjuXp8/fC7uSbHzTNjkG06akPEN9fn7WMiicK+mEf7lsl+of
	 lsUZoZQktm2Xv81DLBAYhyuDMngo1rDKORZYcQ9cV2v0BGtmmvxE5vscfrLUGduryIRIp
	 57CvUdX/hZsn2dovHaEHZySaf9RxLSM3h1xb5dHUndW46dIfmBlXmC4RjlOZ0uIPTug==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFLnlvs3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hLOy/2ul";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 969EA1F000FF
	for <linux-firmware@kernel.org>; Fri,  9 Oct 2026 07:43:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFLnlvs3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hLOy/2ul
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 969EA1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HYvj1598744
	for <linux-firmware@kernel.org>; Fri, 9 Oct 2026 07:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fPHYuMsJqygwwrWIsElqR+1N
	aiINEfs1cFYK8HJY5gw=; b=YFLnlvs31sqd4fH9qHMjkLTcS9r5B1dmBqxpvW1t
	/1rCWqYTA3wYArAB2NUmdkLYlJPASCm63DvSCMInc6qha42MfcNrclUxqTvglTPy
	k9LDPVQ31M3H/iTq+qIYLL35vCVkbWLgdHH3BxIxfXGIlCzKNYlt6dPGJ+FEH2IB
	yHPuWyYaTH5lZB3VKb8s+YMr0FjCJTFTJKLcNaZU2wd/PtkDeuTN3qKK2B3x9iNg
	jPHgGceIbZITRBzBVyRoy16XXZJAY9dWXI/ZuYiyEqejZVvTf23RFukgQzdZf/kX
	DOyEsMRtL/JUulFw1qzI5c5i2Nmra3Rh7v2oMztDd+AJpA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nufsa8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 07:43:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533928ef33aso83484991cf.1
        for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 00:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791531793; x=1792136593; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fPHYuMsJqygwwrWIsElqR+1NaiINEfs1cFYK8HJY5gw=;
        b=hLOy/2ul4T8iyXCz2ArEJIkfxlOT5vVTCnPasD1gZx39BJ0BH/rr0V9xdnyPWThTEa
         oprfT1etenzblgKpU/P3ISLvt1QkGKn9Bip9uDsFyal8RRgksiBGxUh/2qz9C+GtloLq
         vzm6M2chkhTgdnujewbYTCuqEsJY5aUWsKODxje8jVej6jsQiqj8dSzYvmjyl0GtWQBa
         jcnov73Cp/n+5qzqxKOXjS2+D1qsFtiBKZI1k55ONBRb2Tg3AsmsTNuZ6ou4hRKTkzdX
         vnjaUBllU0SyWggVGqCSgLJ5y4le+hcwC5dJhgAwvJML/9eUC0q0YRUW34ewdHqgoxNw
         BRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531793; x=1792136593;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPHYuMsJqygwwrWIsElqR+1NaiINEfs1cFYK8HJY5gw=;
        b=OvocbfMjJ+LGu5yFlVFpgxHJXoLHa7PO8PHjrPqM1XdLyzijVnMVc5u9MNu2h5522C
         IE7sPj3VeOzGfbgBXt7P1jdzneSfzov0hq3prRSf0SYqZqQ5LoK9iPA+puvgdOJ+Z9iW
         0478IIIqhIMVPqu5eKyx+aFan/wtQyJlNEoZrhTCa77AXo+r4jksu9WQDrl4Piy55EdC
         R7+Qa2d1ql3A8pPzJ2jPZMuDq6Qd7a5o0iqQ2JlKwgwZAunsNKXF40clcjfC2Yo8KuQj
         C1w+lAtAKUlCiZoydI6lGQxK+sMB25E8LY+5R5QBaZgfU2B76eHpZjGaZJvt8Wz3Zzp+
         zW8g==
X-Gm-Message-State: AFuF++mIFlq7FghLEtsSsoCkOnrdLBA/N7+EXPVROBP0QGzWCCcCpAaJ
	62ouUpkiKW4kF8smgndPass5NLwRV3RmrdlNykHzqinSe6jFTAxREVLESEPvX3daJ4D26iMKJwl
	fGskrrOijX6cKsG51V+1fMZkCBo17HhrBL6J0ox6FhMhnjTvul8SSRmo9Tcs3/d0=
X-Gm-Gg: AYBFou35LiZdcUZsmkbraUYiDU1YbaF2Fuzu5D9XUEbeUB3mILVZBGRC8+KGcxTujcB
	IO+cwr1D1IYIOdpTbEu4uvwa7Mc+GiiYtJV+CFjrqUQi0Nt07/36F3veSn4fmtbBakxP5ms9IuI
	zim/ESnqzgh0H3oYjxpBYnt0CWpa7JNxZK9Fpzq3+iJ7goBvPqMGcRnaNIvzggPP2l6ITGaEC1x
	WQ4ou4rpyPY579Shq2yICQ5vndHkCdB2sl1st7LGDLLMCh7s0y2dKsKVhMUm1t5FehitQ2FYCuW
	eGd5lb6+2TMnt1ZHsmGtywK3QTBDvAOQyevyzILcnUH+meWCkilag4XOGkWRDmFA5D+1RY2ndte
	IbLJYroygdSMlIdkroguKqH9a4CInQxKAw+3lFVJa/tOgvnDOvMl51o1R7utji0qVh8fly2jrDi
	dmapM6DlPaFGMF
X-Received: by 2002:a05:620a:7118:b0:938:ff8e:cd0b with SMTP id af79cd13be357-93ebd211368mr141187085a.18.1791531792959;
        Fri, 09 Oct 2026 00:43:12 -0700 (PDT)
X-Received: by 2002:a05:620a:7118:b0:938:ff8e:cd0b with SMTP id af79cd13be357-93ebd211368mr141184385a.18.1791531792397;
        Fri, 09 Oct 2026 00:43:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde9ceadsm414559e87.39.2026.10.09.00.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:43:10 -0700 (PDT)
Date: Fri, 9 Oct 2026 10:43:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: update LPAICP firmware for shikra platform
Message-ID: <mphxgdj2ahq6emgeop7dn3n7d3o55mvku4scrnheh7pgkvijxq@xezytgujnk6h>
References: <63c1383a-bc13-409d-8a3f-aecbb6a2e437@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63c1383a-bc13-409d-8a3f-aecbb6a2e437@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac89b11 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=N00JHYSGJy66f2j8acsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfX9Tparkrxs7TM
 JdKgHtx/iqrV7h5dM8L+5OZSmeFVJhzKYpkUqYYRV9Z7OtCmuuaSBPNd3rwYT4I2X9tZNE/V4zP
 6lGb1U/iCNAcAQeS5CibK6HoS2gL2ik=
X-Proofpoint-GUID: DtiO9wZHSdV_BI3DM6ssplkkigCgjw8w
X-Proofpoint-ORIG-GUID: DtiO9wZHSdV_BI3DM6ssplkkigCgjw8w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfX38lITjJoxDoH
 F0MAiGT+h4hmY4CQR7kTlVajE5/wxjd2QQf6yGTcDBGmVwBCRMqnImZ9w/DzCcBpbPMeKDLjECH
 dvMhCUrvc8KHDLmIRnMRWTAUagr5UR9GZqn8tsGWKDv2zEJwAGawmTl2Kx28L+qRW/lgYH9NjFD
 FDAT2qE+77s6lXt0bufV6ZFQv/OW5QtNgYJHI39LXnl7Y+0/Xg9OKFYw1rB1pHDKFDzIdyzpqD+
 E431JkAqNfDnytXDLH+XbkGe/1l2jRqY3YkpO6Nap2tKKzKVKBERMHHpQsO6/lsa07IzxZC7zRs
 93sGbjvTnBGwGds6XOD7R+FiNukyalhl27S9yeqaXlNE76pEgSv8HC5DewmLwOnDqdu9Ihm4Gds
 hQn22lrqnm93SBWsW29RofYc5l2KCfHFkBcyd9/U3qwgm/UEvKIbMyv+TtIf8luMuERC0uptdoj
 RrIrW+sktp8FwQT3BaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090030

On Fri, Oct 09, 2026 at 12:39:51PM +0530, Venkata Kota wrote:
> The following changes since commit 3d352ef53349097f8d922f559c3ea96012c7ddd0:
> 
>   Merge branch 'robot/pr-0-1791489659' into 'main' (2026-10-08 21:54:17
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> mcu-fw-shikra
> 
> for you to fetch changes up to 3eadf1895677969e91cf03b74fa9fa1b2253278c:
> 
>   qcom: update LPAICP firmware for shikra platform (2026-10-09 12:34:27
> +0530)

Thanks! Merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1297

> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: update LPAICP firmware for shikra platform
> 
>  WHENCE                     |   2 +-
>  qcom/shikra/lpaicp.mbn     | Bin 1346527 -> 1258435 bytes
>  qcom/shikra/lpaicp_dtb.mbn | Bin 37808 -> 39760 bytes
>  3 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry

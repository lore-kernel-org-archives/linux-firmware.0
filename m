Return-Path: <SRS0=Y73k=CB=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA69D39405
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Apr 2026 09:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 437A9C2BC9E; Thu,  2 Apr 2026 09:35:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F992C116C6
	for <linux-firmware@kernel.org>; Thu,  2 Apr 2026 09:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F992C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63275cXD1964793
	for <linux-firmware@kernel.org>; Thu, 2 Apr 2026 09:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h6q8w6g+JDuKKArQ1OL4d+ug
	HdXTj+WDi8N/Ybxs2Go=; b=GpMFLRpUpIgVBrNgpCq9Tv/CwiiqxcgGkpm8NtV7
	e84Jg3kyWK3tXlLPNsoiRf6Q0AvzvPNnJKNkMCO2g5WPYhUlcYVZopa3Rz/W8TmI
	Ub9l/LmtKMEMZn3gGg15CHilTl/gxGXmIiBzp/RHFIc3ves9UGpFU7RJwDz6vgdD
	bzzcNV6CwW6OYOJCi6Ub4MMm3jQqM2zdU3dSGYanFe+NqpktLoh9RcZS+QFXmgkI
	5o68RuvAJhrNDoclvfGRaZH/4arZI0FJDEr7hSSd/hiuvinLJI0auwMG8CUNIS1P
	y9aohE4F7oxEMYzqThz9lYJdNzPYPLKbH99LMDGw9PBwHw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h2e64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 02 Apr 2026 09:35:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b242b9359aso6139895ad.0
        for <linux-firmware@kernel.org>; Thu, 02 Apr 2026 02:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775122545; cv=none;
        d=google.com; s=arc-20240605;
        b=h8+8R5pSxFH+Jm5JtS8TMbSEIJHXZyTRmg0ZYP3HD43sM4fQYj0GTM0d3XiVdc67ld
         7auBf3z1zYhEaPh610ixDvYrb0Yjn0cLuwZuD0EU3lSNa/RmMEb7QFfvxNMGwRXa1mPu
         GVhz9hxU7yoV93XDa5dgW3mi7xc4GeetJ+Q+I7U81cY5EWdqhvWJ/uCqIIURyBov4oL2
         f3Vo+M0rLWAi3BxQqKrAP3OdysQmm7TSQZV8eGSOkUAQK3FR+j778Ja3Y2XIwO+VZFv3
         nrtHqaf5CfPgX32sQNMn3kPnmmHAmiaTc+95nGiKgjHUTHtXC+EItI0xw0/TnA50OPQo
         oFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h6q8w6g+JDuKKArQ1OL4d+ugHdXTj+WDi8N/Ybxs2Go=;
        fh=hcBJqa+7KN36uNsxjw6WWoIj9k8shazIYmRTgyDAbpo=;
        b=ieSddxMdc6VXP5eD/O7xgTP3vjLCrTZ4JmFFYI6cs/LZolPUb32zbRBJZ2JVy7uj54
         F0TijfaCVjsQZqY9rNAyGH+v7kGVFsYpyjhiM74zrb6/K5SCKDTKXHPAbkWUtCCis+Y8
         ENihaoK4DcsFdkuOgq6c9rEtYh5Tt7prqZeko1XdXm+uSB159CCTOHGoqi0mRK7NtxJG
         ++OxEGi1LP46FHXLsMqa+HHw9cEq3x/vQfJV9YRYdDLleB5UigqJIh0rq1VckYenDMiF
         9RPL132sZ2HcaaAdR1Ph9NWD7Ui0WF1y6Vb/RyqzPdT/wgkpKsizz+1QpQRqNxNxnOUG
         7wVg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775122545; x=1775727345; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h6q8w6g+JDuKKArQ1OL4d+ugHdXTj+WDi8N/Ybxs2Go=;
        b=IYgz+oqU6Q3UYuydCBm2O/Wlh3rktFNfTJAFet6/r8/8M8xD8U0VIvgCzuvWrOAoIa
         LfuGIbgaprei17YS20jVQnt1vhZ3/6c+N1zEBRjK/LOwhSb79SVhBiRGoNb2G6YFILDR
         OAtI9Dfaf4c8XgQsLJ+ftcc3ToPN8abKF3i6Y/3cncSiKPXZQFr2f6IUv7O39PfLw48C
         cVjSYtw5RdH/KzsqbSD9Rh3I2fujhslbGhGLNgYLgk491/CzXyOnJXVZih9v6WukIFCu
         4fMk14OwccdnJ6ROAmqkX+AzIOhOY0oPDsU1FymVUV/6CyW3eN0vBCx0ivRHQ//pTzCa
         Qvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775122545; x=1775727345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6q8w6g+JDuKKArQ1OL4d+ugHdXTj+WDi8N/Ybxs2Go=;
        b=PvPSTPm09k7AB3NBCk/JVwTsH6bemhJyOk7bs/oyhk8W+nFAz0STFtCVPlK1d1R7dN
         Y9cAkdPlal9Cl8IiZUWEKsj0lntk9xF60Z8Fkodm92vwRFwHrIT5vdJ61A6GLXuS4P60
         mbz6+aoLgviQn3fkz/vpBfcZu3la2BklO0g8ObOuJ8APHVZD84Ekc+pp7mWCejh+9UvC
         tgxZSDPLPlKWe+nWDy318PFAj5mlCXL6myhkxf5OgrUTCvcWtltLqrhzzzuZe3hABvG9
         HeZ55QgBuN7zZMlhJcbg6En4Qx2kVXlO89JYcFQjymvjP7M9EB5OQA6LUP4TgmXlGeeD
         2y5g==
X-Gm-Message-State: AOJu0YxS9aKici2cCAHFG0vebbMjp20k/2Ykk/ZiuX/Y8gKy6a+i7ShA
	kYxMi8wYtUyeHWPnGEJY+DOXK5KSrh8ndRoJZNeh+E8RTljcETvS52laAjvCXC3EidfAFel7tw1
	CmV6krH2xcS64as3gpj8FRo694pDCMBEZ8V+4ex/0oeud+NXzxDU+5Nj9maYb84Qt+VWJ3fYg2l
	pJDop9Q+q+q2ZawLZhHh5r8pz1ldh/5ZiBxFQggA==
X-Gm-Gg: AeBDiet7gXu+e14mTbq1vzKZb6jISXyUTdB4IXIFubzzp2nRJVcN0/xQlHzvwqRU3vX
	UsSWM/M/ZInObnriAuptgfW9Svacv3wqyXTBV3TWyKUUVeSEf85dyUdmC6ZxtvvKTFNkDNQkcTh
	RzsK+1LcShigVHC2ZS6bHVoriR8pcahrVE+StU2c1Q/RxIRwIw03qaH+vP1U+n/mw3Lm7qtmQYz
	FTkMFCE5/yQ9bu1SINP
X-Received: by 2002:a17:902:ef4c:b0:2b0:58a8:5fc0 with SMTP id d9443c01a7336-2b269cfb7ddmr67773945ad.44.1775122544784;
        Thu, 02 Apr 2026 02:35:44 -0700 (PDT)
X-Received: by 2002:a17:902:ef4c:b0:2b0:58a8:5fc0 with SMTP id
 d9443c01a7336-2b269cfb7ddmr67773695ad.44.1775122544217; Thu, 02 Apr 2026
 02:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <8eee8c56-3ed7-40e5-89e4-406060a5201e@oss.qualcomm.com>
In-Reply-To: <8eee8c56-3ed7-40e5-89e4-406060a5201e@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 12:35:32 +0300
X-Gm-Features: AQROBzDwtuDqWJ-p-SvyNBOQeRw2n4MlJXBPRFp5DIZxHBW4hbHtLnGhZ8fg21Q
Message-ID: <CAO9ioeU8vOjbdTTfoAi_1Vf58AQJgH2kjiu0ZWd1dvTARikPnQ@mail.gmail.com>
Subject: Re: qcom: update ADSP firmware for sm8750 platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Saddam Patan <saddam.patan@oss.qualcomm.com>,
        kssb@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ce3871 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8
 a=xMH-FpyWwq-kZwg1UnUA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: u7LlF34KdYzqY5jYYXoGzTN3XEsfi8w9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NiBTYWx0ZWRfX6qmwRaQl1kbO
 5GEt2hvRq/8SHNzZLDyWZwsSqPVXLqTPVfuc7Hx9nASUKj776b0v8I4C9TzIhjp3KJnXnM2GQ5a
 0PjN9geoFMPMRmA7pPs+GZikDJjxQ+jOSrwNTwI68hkGNy4MLlq2DDTBWqZgfYHmWkeMgIwbUeF
 o8dNil5HMOhDV3mB4qVW0vb17bL3TAv70Qw3UvTIFk8vgCXZy5mmPz4l+MjhCKaL+GZtewVu0qZ
 /XbAPjF1i9yYgtciDuyUFW/z9fZeNqT7fMTR4K3EtOSj3160QqBdUfp1WSpDeGYr7kZm3/Tp0RY
 DKisjXYO5lvBEg7PV4yX9ZG8FSsvHZwJVN674QuEUy/E97TDkheuYGnimUOQ7AP/V4kmw7nRBOV
 yMLJaU92pgLc1p8xQQRnFu6G6vM4TknCcnshnmNUEYSkNW0l0FCvVIS85DUcK44IuZQ5Gs/uEt2
 NqD+0irRwqf7ge7l/xA==
X-Proofpoint-GUID: u7LlF34KdYzqY5jYYXoGzTN3XEsfi8w9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020086

On Thu, 2 Apr 2026 at 12:03, Venkata Kota <venkata.kota@oss.qualcomm.com> wrote:
>
> The following changes since commit 441bcf2eaa2a2dd6edbab83181a66a2db537c470:
>
>    Merge branch 'robot/pr-0-1774880321' into 'main' (2026-03-31 13:21:46
> +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> adspfw-pakala
>
> for you to fetch changes up to 91651118052935080801f420ab0c5591c649bff7:
>
>    qcom: update ADSP firmware for sm8750 platform (2026-04-02 14:29:06
> +0530)

Merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/986

>
> ----------------------------------------------------------------
> Venkata Kota (1):
>        qcom: update ADSP firmware for sm8750 platform
>
>   WHENCE                   |   2 +-
>   qcom/sm8750/adsp.mbn     | Bin 19413384 -> 17639864 bytes
>   qcom/sm8750/adsp_dtb.mbn | Bin 180024 -> 167736 bytes
>   3 files changed, 1 insertion(+), 1 deletion(-)



-- 
With best wishes
Dmitry

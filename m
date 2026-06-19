Return-Path: <SRS0=22y+=EP=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0145BCD98F8
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Jun 2026 06:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D606B1F00A3A; Fri, 19 Jun 2026 06:10:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781849440;
	b=fXUfnbDNnmd7hnt4GiOYSDxZfFm0lMrLlS08G5bnYOO8RPcKFAJhrkTZ+D4L8+ZZL2Fq
	 HUJ9vWemXySjgNn3YcXnm3t611mFf70qHbdaN7qEyd1qyozjUEIXoWfAth1ONRbSGMEIc
	 8CT6Q2Qn4meBt/vzyEZAmVmu+3/+aTtQAg/llFWSqFwjffjaYXCgqV4tg3eRWmpcB0ubz
	 gO5Fj5onVL6QzoaYzseoAbSxXGkSC+ES55faqUokJZGQrEf8uHTEPGCm37t2hVFY90VI8
	 7+Svpn/4cNQVoRTbNxMlTlfNyqhy81cP5HjvGn2gDLlOuo2odAwcOs2WlQeC4eVKI6Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781849440;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R0ZpqFHDjcRkdr/MEtpqL4jSJX5XxCkWIlVUQQg14mk=;
	b=YzyWQGKyHpXNFk6dQnYECvR5JdgoELVZ47chsKZsH4Ht9QHo12dyj2omQIFizIPLRS6s
	 JcI+jSXZ8IwxOWi8TlwzpjSRELXBR2+/MO4xBWvzxA/Fxd2ZsuJiI0EiPYTnmK6dMDqwu
	 99zGIljIJEG+/ffwvm8Rk2rVkm02GxQ+vMuKwt9bI8vmCIoJYAnHHy96Az3bqFqevvHaS
	 +Vi1sPPT0W7jMPQuao7cVEdpT+7OZZtFHEDENdjudr08x7P6NWJa/kk2cPhvYb3506Yat
	 FJUvGB/tIxzwawB9qYU9Mjz6IHqYy+Y1sPKX5YrAwkjXBcya2oIM1HD+9zwYOEpvSog==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldOh7mf0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kUF4gMcz;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 359C31F000E9
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 06:10:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldOh7mf0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kUF4gMcz
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 359C31F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2slMx3039474
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 06:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R0ZpqFHDjcRkdr/MEtpqL4
	jSJX5XxCkWIlVUQQg14mk=; b=ldOh7mf0BttaWaSYMNDg6fROD3hC1NPvsn/Gym
	z2oEgHflVLWFjfttXqZHf5bUCYd1X6O7nDDkFDaBFj+xn5MavMDSeUsrj6SIzCWf
	+HQrrsFhEcVcj6hc2m3/ld9RkIOhUu0lhWafq3svA0n5iLF0f++SUAKlJDxAVAvR
	Ytl2+9F0kz2aRrIytVAxpi9U0wm86QP3X1zsUqemiSK+rmfiBQYxFGcSEiLBH/2L
	+MYOcl4k2YxtVDzhGI2NbZVrw84TqzACswhuHVj0JK019hOwSspJXPSyWn+jgWcN
	IBFw47E7JFlJp7kuBdzp5WhHtGsllQqkf7FK3PRZxqpQc8mw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evkvf2qf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 06:10:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8421ffff8a3so2059121b3a.2
        for <linux-firmware@kernel.org>; Thu, 18 Jun 2026 23:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781849439; x=1782454239; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0ZpqFHDjcRkdr/MEtpqL4jSJX5XxCkWIlVUQQg14mk=;
        b=kUF4gMcziWurL9lnskxERb/Y76h+NTw+yagXXafumDQZbP6EyPfU1UFxzy6ez7zO2C
         vNXgM43N7hJ9BqBg7MZBGmsdLWfBDH7gXKGMIK7Kwf6XUvSTQeI0deqvcaqVwc2PKLQk
         3de4Fg85UcwA0omG/4DcBIMiyx/pYXJENmX42SQXky646QbiT3TqpYsiAoaiyD9wvaNL
         2FqQmAA7m0pCuguSE7tKMnskE7bnspg/eJKSeGKoi6sg77qQWFm3G01GnNmO2G7YH9cO
         Tme1Sdo+dKLNbywbMcpWUTu6VbHZfqYN549GYwKegUUXpjrSeJMX/gMXlg+WJjKz5zpH
         TPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781849439; x=1782454239;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0ZpqFHDjcRkdr/MEtpqL4jSJX5XxCkWIlVUQQg14mk=;
        b=OI5ym0egURu34tt1pgl6ndFKSgMapF1ArRnJG29REiNW2rK7Zghiy+9LslTwgqk4qD
         US5O9JuSLVjOvqQ3LtwGGSe3uFclFhHOqMzW1uAkz7mSuaYBqqZfZzwCvg5CmD2n6S1p
         qe9PkRp5GktChcAeH6KpACkd3gPsg4RoXUSB1WEnoFh+xdRj1Z6dFd75gVdgNUIxffBt
         kuErHcw0dJULf8cqQOrR4NiTaaXepNL4X24k+Zaw5Dca1Y4+Dd8tTNZ1K7Rty+tr1jTv
         LqlN4ecvkYIcqsjCy+MePokdCwEGOG0Rti7PNUuyZIDpOHcaLtrbRjpSERnPt2QWGnSl
         hLAQ==
X-Gm-Message-State: AOJu0YxmgwxN9IFVPX+oRVQJtMJvjlIIapQww/2h4vCE5e3d9Q199zme
	tP1CWPw+iBBqtPBgiLhCE8+u4OipUDYR47h8Xp3hS8nHfsDLwDukWPbcLWrCAdDDzWpHiLkwFvX
	2iUhNjR5poSj8GnKQ5KGtz6cLFG0R7Ycbm+JC0MUIvM2JXxrXvYZo+600YVhUesXFsBJ9fsU=
X-Gm-Gg: AfdE7cliN+4S7YItnZhvON9r/RT61WdQjCtkSn50WSP5rRpgTHBexl95XQdW4WMTZVa
	Lh+nj/OWr7PyjePNTJ3SmmxuRaaIOR4hk0hVMsmmz8rihsBTpRQu+a21jN/4Rsp7RVr6vDU1cog
	eGmYzOFyLmyM2+rwIuH9BZwT3JCRpSp9mnQEm4gPFG9WAKmeEz35fkVgwc8a28zR3l3b7T8mgSL
	6EOsgBZUOZVCi24dr22Pi7Im6EfexfM7OcaoumC2bYZaamIeMsySj21W4j9J9/2PnaSrMSMzrpB
	4s1Y12On+EsgR66nIL5+QbzFghOxY7ds8wDCQOvCZqvHfvIuGjB+URFDSm839fNw08hvtQlEPhO
	nvNU3Hlrq7L0+GFyt3sDcnyg0XtbzLs75ocU2j5Q=
X-Received: by 2002:a05:6a00:2da7:b0:845:4d3d:c8a with SMTP id d2e1a72fcca58-8455616a4cbmr1449136b3a.32.1781849438642;
        Thu, 18 Jun 2026 23:10:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da7:b0:845:4d3d:c8a with SMTP id d2e1a72fcca58-8455616a4cbmr1449111b3a.32.1781849438199;
        Thu, 18 Jun 2026 23:10:38 -0700 (PDT)
Received: from [10.216.5.247] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455364cbbasm1190596b3a.1.2026.06.18.23.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 23:10:37 -0700 (PDT)
Message-ID: <8b8eb8a4-a138-4e0a-beb7-9d6052219996@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 11:40:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: update ADSP firmware for glymur platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA1NCBTYWx0ZWRfX5e2Uv30Y/3VZ
 IN35mtBJAzA4tPynqtjLXlkeH2nSIc97c91PDz1RPdhVoPe9OpTwp9+0Z7KF0AhK32uBUmhKiXP
 pXzTy5KMl3fL008FscaHa/IjkFgjpE4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA1NCBTYWx0ZWRfX2mJiRPW6xdEW
 yWyTyqrcUSQ66F5fFnJZr8zY/2mcmUOWNfJSyX06puNzvT3e/PUH9zXh1CThv8LEEliDmui4VgL
 7q0sjbEfx0oSiowBaiQsJgn5kXOmYiJoXj7huiQ+kpg+qx0XbDTOxPxtZrqw+HlHmIH7N6fcfRQ
 l0DyNogFX3G71ylADfekcLCGu6gI4FOOzbgAgsBIxtCF+1bCDQs8/Srv+V5qkFr2udk+7IjzF3Q
 LDcX1Sjplc1Kmbyn6xxM0UuTo9OcOgi9FTLBRqIHGLxGqK6Jn7GxDqm+9gh6hMbcc44r5wfbAb+
 LO5p+UPs2ZlqB2rb5IsEnJjN4+BzlZySy4w/EbmBtyLwBgZbLRHg34GEelOi2oU2ZogK6cvAila
 jUkNWVY57GoGcf12Zj4I9WdMdelTG/WEUuXAWtn+cGyiynwBzm3mgXpOJXa6pqasQyBQBsPfNVY
 lrnPn0dEGnFzxLZnmbQ==
X-Authority-Analysis: v=2.4 cv=H/3rBeYi c=1 sm=1 tr=0 ts=6a34dd5f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=qC_FGOx9AAAA:8 a=hMXMwYmzv-2CvN4CDtIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: jQD3nxVnZMHUClOzTtJiePLx272bcULP
X-Proofpoint-GUID: jQD3nxVnZMHUClOzTtJiePLx272bcULP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190054

The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:

   Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-glymur

for you to fetch changes up to e76f95183c72f1f5902234d27cc2bb11b015778c:

   qcom: update ADSP firmware for glymur platform (2026-06-19 11:27:47 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: update ADSP firmware for glymur platform

  WHENCE                   |   2 +-
  qcom/glymur/adsp.mbn     | Bin 17053656 -> 17070040 bytes
  qcom/glymur/adsp_dtb.mbn | Bin 225080 -> 225080 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)

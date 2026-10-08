Return-Path: <SRS0=Kdzc=H6=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3035BCA600C
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Oct 2026 19:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3A551F00898; Thu,  8 Oct 2026 19:58:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791489532;
	b=mIDWz1KPV75qdjsgdguzf1BSusRXCJb1nSQbvigGvmg2rdjP6fR9giCHdJBcREYND40K
	 2cw1sl+5nvrK9wahTw/Oa9s/BDlhtSfGEUYpaUND0d7xFRLxJCa29p2iaxnhNN/CCobTI
	 dEdWyy8zQdEvjpkU2pdVfe1Xa9C8gGGwamV9DFugA4RjoajsAW+dUr39lFFLuyEpEYiiW
	 VUT4o9sVJKti0uRX+OszqT9vW8dl+6W0WGeifyhIa/RVm7u7dtu7DvElR52JB8Hx5X9EG
	 bUm7fPxY7foPTVKReUjeClyRxVtHldCRT8AMilFAAMHgdaLObNkhg5S9lowNjRuM0uw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791489532;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:List-Id:To:Cc:Subject:Content-Language:From:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ebm5pPz/0g/tl4YeJ3Jr8z4GlCJlRVCE4c+RayxNGYo=;
	b=jBZWIoke5LC8+SroO1QNMxzst4wxzKwpGTeBQ5JKCQKP3wP6Xdud8HtreBPMv0x4JaXW
	 BdxMcXQjrXpp74ZYSY/cqXc2XDQbpiDbiir7IOpU6SOlTcL8luBp9ChOL4TIyfnOqZEZa
	 vGjdfhebTJfNn4fSE3+fQ6w/crU5lgdj/+S9Zv1oW1Tgy+yc58JMXgYNkE6Nv9WP+6Emx
	 /I5h+WReGIwLgsHq74IsxPfT03a7/CMn354IXJG7zFiICPlqp1x8mECKB3rjSoB0ZyF/H
	 YzbEOoT6XB4lVPguqMDg24Cx5EUICvtFtd5SrsmRYfioo0dnkzWb6k71NpGMllJil6Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TSh9G+Os;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EiXBduMV;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35D511F000FF
	for <linux-firmware@kernel.org>; Thu,  8 Oct 2026 19:58:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TSh9G+Os;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EiXBduMV
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 35D511F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698HwXgK3468392
	for <linux-firmware@kernel.org>; Thu, 8 Oct 2026 19:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ebm5pPz/0g/tl4YeJ3Jr8z
	4GlCJlRVCE4c+RayxNGYo=; b=TSh9G+OsXhfm89ob9xVjQRWC/oY/KUteaDdiiL
	nPGfiBycxAbaJSuvQ7GyZ4IeiO1mqqgjlukzObzRDj2EXmEaEXHmfl1kaQO0shHs
	qb+yI/j1GsJxLe0zBc0exsG9Dg0hVgYfkwduqOMHT0cWFYqECMYIWBHytMd85R9B
	6/P2b0xlkjPw54p2Kx6hgRSIywmsPIFaocA4wFlBjzvdIHRLoaebYyHLJQIwSrc2
	lP8HDjYHxLKZQJyoMgoAwH+6AD9svbgk8H8ziHwldNsXXR2x64aHuqCgVyjzcOCn
	E/afPiJPcrVFlxHRhjk+JDNx8IjwcCFzohn2ZjxC83PJH1fQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9khmpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 08 Oct 2026 19:58:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-313d1015161so16172176eec.1
        for <linux-firmware@kernel.org>; Thu, 08 Oct 2026 12:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791489530; x=1792094330; darn=kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ebm5pPz/0g/tl4YeJ3Jr8z4GlCJlRVCE4c+RayxNGYo=;
        b=EiXBduMVZXu5VsLCEJ7Dtj8PxPC4iKLSfE95lPb5CRHdLM/xQTBBURJnBlgnKOnHb4
         490CX5R2tzSUfOYlq2xOYK8Fo3aRv7pfTkfkhH+fImTjYJh2CH92hcyO9XFGsmRw4naS
         5WbpJnYOPVo5qoa/Ao0nU+GJCmbQujBEnlz6T7JAJYMg8LzBbsWA6QevuGqCU54Np1+O
         OIuOSJ4BQSisgE5eAL30J4pfhvXWJwSFFmo5YIWv7G866N5IwgPdX2/9z0qFcZRIJmQq
         0Ele4JUuEI5kMct5QK3JlBydLdEVsX0Vrx/1Ja8pKgiPDCXa83gTpF0DNQgmFkd2SpoU
         4slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791489530; x=1792094330;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ebm5pPz/0g/tl4YeJ3Jr8z4GlCJlRVCE4c+RayxNGYo=;
        b=MM9lyOX+hzret3p9B+Q7pSZAOvlM/ODgPeQNZTfr+gL+VXhQelGZ/mPgGMFq6WNbvs
         h0J93ahk/xhDfVvLXvvBOc0QcgwIO3aVYXDokcxTc2wVDgdEKYqL/sKpZfloW9oVWMir
         iDRfjBvvL+hw2/f82UtBdmb/pHmPs91qkY+olZLVh3iZAy+GkV3202L7v1Oxkr5xybvJ
         IVPkmAqHXhj3ezrxU3WDFym5/LctfW83JzD8d/39HUzxPHNOEqKlNb2qjyQamE+lzvWF
         eMor4yHAh3UtQM9GDf5qz5iTacXUpZah57Pw3bi6Uiy6y4iL+7fIA/J2LsDIfDjaJFQA
         Oigg==
X-Gm-Message-State: AFq9FYLPeUL/7J3peUruZXdrwiHtPG2MTbByWHwh6Jt61T3cyfnIPKEG
	lTbLB1Ivyq9d6YT2vyo9qNPnyIlK4RvVGZKgg3Y/nUV54ZsN+j0L9sjDASTRWDNHMtPz/M4f6wt
	I5Teb4tqBwi6OrArnWHp90sl+ffZMiotYqkeKTpwwzDZG+5CaBPVl7pDurSDcSZKg/rawDII=
X-Gm-Gg: AYBFou0dwo0KbzXE13EuB1zppURyR7XUWeT6MMOlM0e3Gwf1huS7FzMob6kjt51pJ0v
	HpW1F9O4lO+UEVrLrVHohoNasdXHlTiySCuVTpZD+XEvyEFaLBcJ6NL3LYR0M6dAbAs+xFs152Y
	peSlsdvoZeI0cLQ2u08m6tn0eo9c0eJo5AAKbky5ULlGQi6nzZua/TFGcLgCYcZTQ4UlevnYyMG
	Cb10AtghHyduqfy24aAEQIhbPHSiqepqxR7Oiesp52eIcuIevOuF7fa1D1Keizg3kE8FD9IaR08
	EZQ6xdKlm6C3tPIMbiPfDyIAmD+dt91+Dmn7G6Ls0rUaWyDUBzQaiZECeqSB8Br5fQpdWnViKzk
	X91crnViZUlKyCCr2/dBjcZkdziTXHjSakrs=
X-Received: by 2002:a05:7300:560d:b0:351:165a:baec with SMTP id 5a478bee46e88-3515e0030d5mr7053375eec.37.1791489529800;
        Thu, 08 Oct 2026 12:58:49 -0700 (PDT)
X-Received: by 2002:a05:7300:560d:b0:351:165a:baec with SMTP id 5a478bee46e88-3515e0030d5mr7053339eec.37.1791489529022;
        Thu, 08 Oct 2026 12:58:49 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a2afsm231759eec.31.2026.10.08.12.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 12:58:47 -0700 (PDT)
Message-ID: <5ca444cd-9d83-4805-88ba-f551576961cc@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 12:58:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20261008
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eJsF_Qptx7_gPE59c409BAoxrmO96VEX
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac7f5fb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=WKo8ZlZ-uQDsbn5PVaAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA3OSBTYWx0ZWRfX4WJtI693Jhzp
 ZezbuJXnOxyXO58CPBs8QeWotrrMX1MYbVcgTw9EolRG7eMJY+GT6yLdfwn1mA+1ThF1srXt1nW
 u/QGj37t2YrOmiBGbfB7kvJRRVLn8zc=
X-Proofpoint-GUID: eJsF_Qptx7_gPE59c409BAoxrmO96VEX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA3OSBTYWx0ZWRfXw59sSGLmIOnp
 3ol8yfk24/zkUrUZwGqA1xv5b9aiXdJ7hN0HXXgLAO49+6TvkM8++r39w0vSKRjnSmBooSAatTh
 fn0pZTbLvQqBXHtvR4P7hOu6RyKqnWUD9VGj8kZbeAUyi1csobc6wuGPd2JcYUngStaOPsgc+7G
 XTQWGlAthS6vefuIXoiIiuiduQFM5s/Z2l9FPU8uyho8OP2VwNxg0AC0WDF74xB2KqPop1RiPHX
 XKlc7ju7Ysry2UF0ohDbHwk1/+A4Vsuim+ztNe8WU+RCFOGcoQeV8YP6Mq1F4paHkmeuVeQ796D
 pOcPNUynJzbiaI7NOorS7jVThBKecGBVEVQZrLiTSaJGAdzXSjNNnnUeKJRXwTRI11gPz1VusGK
 5F0sep+XJGQ+Nf32R85x/B78zbk3Qe/ziuGjpuNF+per9VclIGSVP0KOBUOn+LZovAqh44LshKa
 oilujDx4hVW4/Xy3Tlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080079

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

For ath10k and ath11k there are no changes.

For ath12k there is one board update:
WCN7850 hw2.0: Add support for the Samsung Galaxy Book4 Edge

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit 24247053afda2bab6b4ace42402dbf9f3b1305d6:

  Merge branch 'arch14-8' into 'main' (2026-10-07 12:01:52 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20261008

for you to fetch changes up to 575bbe3f83565d18caa73e9b9458f754dd286f48:

  ath12k: WCN7850 hw2.0: update board-2.bin (2026-10-08 12:37:22 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: WCN7850 hw2.0: update board-2.bin

 ath12k/WCN7850/hw2.0/board-2.bin | Bin 2431852 -> 2431968 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

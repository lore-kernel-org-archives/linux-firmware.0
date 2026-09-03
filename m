Return-Path: <SRS0=8rqA=G3=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4875CC624D7
	for <linux-firmware@archiver.kernel.org>; Thu,  3 Sep 2026 10:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35CE31F000E9; Thu,  3 Sep 2026 10:47:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788432424;
	b=X6XpO/FvNQRpG+Voo0MT2SKykNZhi/2v9qxZCuWhsSEoxcSggMCrvzrwr7oB1wSBk2mx
	 wJuTW4jSlfkorA9D/wwU0wlKrpt2cipAhjjjc7EG312FlChD6IIhFLJ6nCvN5rybQwkPh
	 bKl0V7KUeeUpPsVhTYmvP092oRuiyh7P+mEWBOwIcN7jtQYgE6JPckTTfcW+sP9dyfdVn
	 ox+m6ttdt1/vmVXegyXbdJ/KhT/AnmkLeKmNaEJbKTFFDJ9SYPa7CNUoNT8uBEO1Uxx0g
	 /P1ZvRriy84RAoLfS3Lkb0Lt1Kttdx7D8wCdrLPuUstUCbV5bboSUJoAVwfeYX8qI1Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788432424;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Content-Language:List-Id:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JLUt/q+M5aJbPHpeGd1pVjwy/OeA/tbyMFhMp7BiJas=;
	b=xUqa2DQ7c99gSIGSkngv7SYondcoEOEVhAMJuBdZXwpqfrxH07hcpG16yR9yNitv0kYh
	 GUBlzh/+qn8R+seQp9PED8ToyLxqbcrO5BR9gzSpNgmr2nECG5GL6c8cR6wnI4d8QJKWB
	 dghqDeEtzjR8xrRcs32tst3LIq19Wwph/u1JHhH2/wq1tOZ7CMa7opbvlRnk7wb4j9u3R
	 B54Vc206c9Zg6LLWfnmd8X+dCCO2a9L+MEpv3rHCf+l2J/TjuoBsHqyxVMhUr1xWZerin
	 H/t0uZipchNPeMYG0J948w7tVXkyYgDu8Bv6xataHbZ+Zmm0UmbUzqX/Y8OljgPnPmA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oLRLJMCj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jFVuT2nh;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 005111F00A3A
	for <linux-firmware@kernel.org>; Thu,  3 Sep 2026 10:47:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oLRLJMCj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jFVuT2nh
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 005111F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHDQo212469
	for <linux-firmware@kernel.org>; Thu, 3 Sep 2026 10:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JLUt/q+M5aJbPHpeGd1pVj
	wy/OeA/tbyMFhMp7BiJas=; b=oLRLJMCjtXwBgMzKqQmdyoDLOW1KiL16g3bv5V
	i5flzk2X0CH471t4uMQ2FzlLoQMZGLAzFuYtR2vI3gp966bJZkrgqkIQHWU86uRn
	r/CLvlAj4E+CBTpbyFybwRmScZS59k2/fsVk1RXw8kTr/9Nx7COMuUZWmOY7tAuA
	IgtcXT1kPc8hq67MXIcqyXJd1rK3cSudPknhO6Eya3tW66zsCuR8RUBtBMxRp4P/
	iRWjesQ1hSRyXC+4nn9tMIyDzb49bAaDbi28G964HG8L6TScsgdEHRFx93wvAAqC
	4dWPf3QtYVRsjCKRzSOex4xFFKHUrrwtAtTAQJNdbSIphPjQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyhgcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 03 Sep 2026 10:47:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso4164924a91.0
        for <linux-firmware@kernel.org>; Thu, 03 Sep 2026 03:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788432417; x=1789037217; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JLUt/q+M5aJbPHpeGd1pVjwy/OeA/tbyMFhMp7BiJas=;
        b=jFVuT2nh0fHVIwI4yzpgFEEcDaF1KlwLK1rYgwtj8H5F9SrNqcpQg596GJ7tiJ1V+k
         JN5de6QWdNwHNhQjAfXP0dOE0fYeXbxbAjOfBPABvN9QDeHcMGZHr16x3ClJp1EzA8sT
         TvJWxesAQ4HmrB2C81L7wmMspYXPgEDL7Q3bKHYn8sHXbT4e9S64sAIbISwZMmbqj1LP
         gIgQvCfc/ReBNGQFn/OsUohWIt+hy/oIj0ZpDfSRKVKOeNXiOhea9rs5vG1/XtjUCK3x
         Wr5nXrU0vkEspwfOgbqx1w3KQannBuT8BMivyhzO5X6CzoJdgKKwaN2E7FXDbxMGQMsu
         c35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788432417; x=1789037217;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLUt/q+M5aJbPHpeGd1pVjwy/OeA/tbyMFhMp7BiJas=;
        b=iqOUPit9l0KRWhfEX51N0JXjM1k3fPx28OPEeChf1J5SAmAb/Egm4lfjvKY9T61ktt
         ELLOFXesyQy0AHo1GmggdvT/qB5IunOM9OF5/qVg9+ZIUJPVl5aHDtFALJ3tQTGyb/sb
         zZ1uDKpOfLiFPQEh4MVnnPgIXZlOQ31lGgT7jcGw+4q3RxNlZKtl2t4ErwM6UNVeqdxa
         fLljDklDhHKrP79kZ0EF/LGWHXLP9Zeh4YDbvWp7FjX/+rqWgiDY0y9FDdVAYH4geh7w
         FQE20KDY4FW7BnbyyJemeRWFaBES+8NWuKlhd13otf9LafhERYVibokYKllCYXWPF1um
         PjKg==
X-Forwarded-Encrypted: i=1; AKwUvBwLyeZfx1cQn+NxGja4Y6ih3h5pn/JWasbYrQSWupuUNk5joNoGrqL+pApaphUFCWLSGnxFDalr1caJFU48+A==@kernel.org
X-Gm-Message-State: AFuF++mumoBJ+1LnfRyHCe988xXzGKxgxY9B8e+nbQOLR/bN5Kjo2O+V
	ZuVKMwWpz4hVUyphbihaRvNTJmZrRB3QmKSsjsh3cd/MIate4MCz184CvrGdQ1ty7YKY1RgWsAg
	4NrIcKTkTGRcJ3zRQhsxbRjqD+Ake9VRFszNWBCHgYDQhI90Y3vq4zpoJ1WcCZfM=
X-Gm-Gg: AYBFou2MbBY9ji+TVEQDx1Ydqd+ZgdBjN0arg2080B61cOfgeQkJir9bxU0WbTQNxCT
	+2iFhZtUoARDlo8YI/R0LKZzY6SOYyDjae7JziSfZQf6yuXMfedf2/DtHqgJlsfIsAduZS03PK0
	7zo8mHBUZ9J0aw/mVwtNcnO/rh/q1pMJnvldBFPHbW7VjTdNmpNy1kFvOcSRhUIbtcEuKYX7Hmx
	Jg+CsweUnaAqSm/hTckVG+ObiOFu/BtgHuCU7fQKucpUIKWqTyQix75lDRM1zSSnYsGX+TjsDsw
	BxAbPTmGQxgZPOvmzjr48Sn10brQcES8ftj/fh49rhaHZObaKW8UuwdCEVxCcuhC+arUyKxH1VZ
	Nz+HhGPNNGGQNTkrB2OcsVKtIkgL5
X-Received: by 2002:a17:90b:2649:b0:398:d6e6:4671 with SMTP id 98e67ed59e1d1-39aee249be6mr17672957a91.25.1788432417394;
        Thu, 03 Sep 2026 03:46:57 -0700 (PDT)
X-Received: by 2002:a17:90b:2649:b0:398:d6e6:4671 with SMTP id 98e67ed59e1d1-39aee249be6mr17672887a91.25.1788432416892;
        Thu, 03 Sep 2026 03:46:56 -0700 (PDT)
Received: from [10.219.56.17] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1431990a39bsm4648517c88.3.2026.09.03.03.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:46:56 -0700 (PDT)
Message-ID: <2884febf-ab38-400f-8f37-38cf3b0c801a@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 16:16:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for sa8775p platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5MyBTYWx0ZWRfXxuVWhC8xoBFx
 FyZvn+IU97v5claqy2CZsTa+VgWdFKnCgKYMKT+N5VSK809CEPa2CglkoB9pplM6+iuWID6htxy
 ZV68s/6O4GOW6dMLucCyREeu18OvkxEu1MjBUw/Hy1T7SUJcpRoub9gB/6NY/UoBSJm1VSkMWgG
 h7Qpvsfho8bzdHgk1N1snje2JfZn2anGt7jqlUpIU1gP2zMYycK37XFNDFq6oyD9FJjBZ6p0/rp
 Z5z+XO6F10qwVRmO7AZmOHfVOpiFoPBo+mhW6rm1omlSGPR8qT2shCVBsnS/g5U806Xd0kGjagq
 9CMZm3mOLIiGjAKZFMqLAZFeHf2LcfdP0HXL0lvoi5f4vIpNMXThDGp6Z2rxkwlfmWs08lE8FlG
 CtmBSTGUJOhc2Eov+qEhXEGlYP608VqcWclNGt+fHO/MI4V2QeuPqhGMpjTlkL0PYDCkqcXr0k5
 3UhRqjVE87g5cQ61mlg==
X-Proofpoint-ORIG-GUID: uXymFW8-SarVEswU6WM20ZWGR6eGoDo6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5MyBTYWx0ZWRfX/Drjk1q1qipR
 r6K0OQUZuKj/dOBJkfnLUFyxPjlnBRnkZyHKCtmXPrUN7PdLilRjF5WdiqEvXd2lehiLA/3jLnJ
 q4P7lylXL1yVkYNiOyyDDqtn4qkq6Kw=
X-Proofpoint-GUID: uXymFW8-SarVEswU6WM20ZWGR6eGoDo6
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a995026 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qC_FGOx9AAAA:8 a=zaKaClIhwoY5PkX24FEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030093

The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:

   Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-lemansdsp205

for you to fetch changes up to c620d583926156dedd51d9ce636e9ba06297ddfc:

   qcom: Update DSP firmware for sa8775p platform (2026-09-03 16:01:52 
+0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: Update DSP firmware for sa8775p platform

  WHENCE                  |  10 +++++-----
  qcom/sa8775p/adsp.mbn   | Bin 6803456 -> 6844416 bytes
  qcom/sa8775p/cdsp0.mbn  | Bin 3174400 -> 3174400 bytes
  qcom/sa8775p/cdsp1.mbn  | Bin 3174400 -> 3174400 bytes
  qcom/sa8775p/gpdsp0.mbn | Bin 5996544 -> 5996544 bytes
  qcom/sa8775p/gpdsp1.mbn | Bin 5963776 -> 5963776 bytes
  6 files changed, 5 insertions(+), 5 deletions(-)

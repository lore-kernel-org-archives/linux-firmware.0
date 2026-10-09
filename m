Return-Path: <SRS0=v5zq=H7=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2824CA5FED
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Oct 2026 08:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7C1521F00893; Fri,  9 Oct 2026 08:57:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791536247;
	b=hz8y0M7+40N7SBe3Wt136u/G0EXvvcDarxHPis4G0J28KUnxPqE//WJvv7dftOS3skBS
	 cfgAm4ZqPAZkb5J1vBu98v13p2oRigIyGk78Tn0AARy8SprTYH1g0yYiywVobgvjE++e6
	 WM/DovFWOYbm0mwO8NyFf0MhxvkoNF7Bg9nDmfC29i4GmH/FbWgCH/q3oo2j8SXUNP7CH
	 s1qF8XYWICvH4THC0MjS1/oKdCNTndejO7lSylmmoNta5oVd3jUHwokbT04rwyR8lHfOi
	 JF5ue0U/wMkcovdPXACfQNZl3Whnr2ANBQgibpgBe5JerR2IQjXreFiFE4CThtz7opQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791536247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Content-Language:List-Id:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/85SkXF/Ocb3q7cSwUoGGaI9qFHs5AFzQCJHVnBzCQU=;
	b=B4A3s0+ZKEXAtCGGyQjNSCFIAJUGc4fEbbN6xxAaGA/CkvnuMs3t3PEhfhydaaR1u4/Z
	 RtfGvVo+U07utW+JTUHWRmo9QLTkW3OWOEbBPdqn+SW8MOvCFx7hw99G6pOevKIKjs5Jn
	 ytbNOaC8TGde7LcHFUoxy14QeQOxFgXZFTNG4/NLajZyyRliGY9jyGHfsGjyA+o7m3361
	 UH64Dc5Qtm8h+yfk3OcbJVqtEqX3IjHJ5Pzy4zPnnNGBvLaqC+P0Og6gzUsQTNBVSoVoZ
	 +bxD0MEOwf7dZ0xyOs0pXMNZE0ZBR9dsQoSLRtaozqx+M0M4mKLnhiWSnnyC2rcecNA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F45cVrUk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CJp7TAFJ;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C71161F000FF
	for <linux-firmware@kernel.org>; Fri,  9 Oct 2026 08:57:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F45cVrUk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CJp7TAFJ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C71161F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KNcg1223198
	for <linux-firmware@kernel.org>; Fri, 9 Oct 2026 08:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/85SkXF/Ocb3q7cSwUoGGa
	I9qFHs5AFzQCJHVnBzCQU=; b=F45cVrUkTleSDfg4n17BonFntD4LDVCo3jHo9W
	wmXie3nXVgJC1TBas4QWeOP0f+QuyCBfyyh+gYB0Fsk7qS1wL6VQYOQ07/oUmdoW
	Ix3G4jptotgNVNK+vJt6fjv9Knk8Nl3lH0/SDwDYPKCvpMAr2EeOGnMZw4Pd2J8e
	7hnaxWVAGblUtHNfGSzRKggzjEF/K/RtyTygAUPRqPMzBhXKt30q1vSlChYIfS6s
	6l6dnc6VzhRf3ZXck80FMEV33Uui/opWfxmdWulBfug+Qsc9nyVZ2Yf9TzK6cphe
	OkHZTNf3tD2STSSX5XjloWhofwKmSgtoi1J4snS8DdKBw9uw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkaq5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 08:57:25 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-152d1363a29so13595744c88.1
        for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 01:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791536245; x=1792141045; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/85SkXF/Ocb3q7cSwUoGGaI9qFHs5AFzQCJHVnBzCQU=;
        b=CJp7TAFJ9NNRbO2sFbQ7Vg08VszSUbAGv4X9cdj+GT5ypj5DjBpi2ZWVhbd8RLXD1D
         R0Azh3fcj+59Pesa7Byi3XJyt3lk6A/JeXNa2mGKWX4wT9l8FMZg142hiOuq1iSV2DhQ
         B8Mz4mK062eEsiYLcpWTzuTkewnxh9yBRjcxAqH4obt2v3kkvzLFEv1Vj4eGvRvIxTTf
         97rVvecOUeMA2dl05tGhyffDk0UvEwnI95VX3xASwiX9X65in0FbAznlij8PLEhVr2y3
         G3tKIn8MvFA7qyCL85KXo57KuxgUXeZ42vaPiJn42ds6Bo+XeJKVIOHnU2napf0OQeWx
         2ogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791536245; x=1792141045;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/85SkXF/Ocb3q7cSwUoGGaI9qFHs5AFzQCJHVnBzCQU=;
        b=uu7w5JlA2m2KSb74vBOHCvLnPLmfVucUZOlyqUbBoCNDkwbHZCHPsbiK9MRkQvUlrn
         INS1prEaP/0AjpP8+AObl1X2Eo+lQmrnbesC4u/6KyongDLoWEiacAUH29e8x9fthge8
         VblKv9n1YFAiycQH7txdk4cAoSk1QnYW62W/M47yS1BFzwY9v7vVoXnG9KEdvhV750+7
         umV2tA4p0tI7N+26Jws6hEYzx/5O7Qp0dJ80aTurg1WewyXJ2HLjZc+xIINPAg1O9Zu3
         Yhv/l5p1upxytxUTSQmShv1loCVRQd16OEfizwpH6kFQ9+6R/CFXLGYe5JR8+Zc3dT21
         lzew==
X-Forwarded-Encrypted: i=1; AKwUvByNSXWLNF12t71YPJEfd9iwEZFzXBd5ajku2x6goV3gucqSiwe5BMvNaqcpGpFYZAzklBiZYM2Fe9RTAhkziQ==@kernel.org
X-Gm-Message-State: AFuF++mGmjLAtUpN67UY5wyCfoJRolDo6x9goFWY3l91Qdzu+FQvYHCF
	hqV3LID8o/3PAuSiiurPAtY7I7oaVY96no697wXhi1UrQCbE0HxM/J3xM9MSuQ4mVN+IklBn6Jb
	bsch0SootyRRw7isqoF8tfjdNolYqDHHWKqf25b+8/M5olwcCxSPtUdXm58prVlw=
X-Gm-Gg: AYBFou0Lne0cRmq8JtdAJZGbgd5v2SxGzWQcHClizqtEpdFNugBEKIyaNML+0y59wVB
	1/0tALOOjOnczQPxcLh4vQTMIimr/hnW08qz1bhvH6G2iH+AEs2NGLvFPuAvSibfI+fUHw7isly
	9CRP4b0tfo6JezeBFgOLOiQVgTo2OF9DjaWRTZsTyKCqzypgktxT3PUHPk50ExY5TSgUskHnILs
	Mijj+9VZ2u940Mi+7VrqPcaSXn6zYoWuw7JkE/Qm60TMIbOF55iQ06/bT+dvEG0pLmR0rOCRyNO
	Dwet1i1Y4E+dT/RDhsnQSePhySdxTuHXj4M+una/Hfeiv6ltInDH+vHpTQVnLzNr4zQB2SqE2by
	tvcm3SmDCSZ+5cNIzwHyihzCQL2+U
X-Received: by 2002:a05:7022:5f11:b0:167:d73a:e994 with SMTP id a92af1059eb24-16a5dc00ea5mr1659732c88.24.1791536244587;
        Fri, 09 Oct 2026 01:57:24 -0700 (PDT)
X-Received: by 2002:a05:7022:5f11:b0:167:d73a:e994 with SMTP id a92af1059eb24-16a5dc00ea5mr1659709c88.24.1791536243958;
        Fri, 09 Oct 2026 01:57:23 -0700 (PDT)
Received: from [10.219.56.173] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm11154466c88.13.2026.10.09.01.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 01:57:23 -0700 (PDT)
Message-ID: <9a5d20e3-c72c-4c55-b4a6-87a5b107e9ce@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 14:27:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: update HPASS firmware for nord platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B-69a-njQLRC2_MDKXGmi-YD04xizxi0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzNSBTYWx0ZWRfX4+tEQW+s9XgS
 +yrxIDQqZGWSg6kNKHEdq0aJkRT3eHauOKGw3RZ4X2wlqGQ4TRjDxZoAf9yyPOGobhdQw1nc6SL
 bUaYIBHept+g4+OzwuiFMewwKOwN8y4=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8ac75 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=qC_FGOx9AAAA:8 a=ymPzvEbOTSeJWsDjHFkA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzNSBTYWx0ZWRfX2xCAXlwuRzpK
 l2xc9hYQ9tjRVuYlbQ5qiH2A2zeWJkf4YUREvYHPctrhoY+Uqiq0QOBiFIxcvqBwJBMl2YFRLm9
 CAq7JWeK7QdupIBce2sIIPAP6v5kExNnSTvQ6hBQSZtFDEFKLiSE7fFcUGeL8aPQVZOrpAqOR8g
 YCrze5P+WnFxVbag5BPwV4Z6UpWNiXdBDS4J5L9dHESH/sTueIRwlphuzCDmWBptms4qM/y9M/h
 admKfuWCZVZkGoBhOa4Ox5J0EnW4G/wcddbTmU6CkBXF6TUfyqa1RCvrac2A9bso6HkOc0sbZjG
 Um+liJSt/e94j4NKk8Gr+Q01Acv8cwDfDvlnCLPOXEIew2ESh3/suYmT3LXfWLOK0HM6VnnbC1n
 iKT9gD/MQQQGUTHb/YZqeUS/1oJ00wzNTqW1wd1X5/weWF8hZ6tAQzD8nAoud2K5UjaufHENlVb
 ySg3tN3qiLrlIri0kQg==
X-Proofpoint-ORIG-GUID: B-69a-njQLRC2_MDKXGmi-YD04xizxi0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090035

The following changes since commit 24247053afda2bab6b4ace42402dbf9f3b1305d6:

   Merge branch 'arch14-8' into 'main' (2026-10-07 12:01:52 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-hpasslatest

for you to fetch changes up to 10a0d758cd7005f323b907061ce09db5dec7ccb3:

   qcom: update HPASS firmware for nord platform (2026-10-09 13:18:04 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: update HPASS firmware for nord platform

  WHENCE                  |   2 +-
  qcom/nord/adsp.mbn      | Bin 8950424 -> 8950424 bytes
  qcom/nord/adsp1.mbn     | Bin 3470272 -> 3470272 bytes
  qcom/nord/adsp1_dtb.mbn | Bin 73728 -> 73728 bytes
  qcom/nord/adsp_dtb.mbn  | Bin 85864 -> 85864 bytes
  5 files changed, 1 insertion(+), 1 deletion(-)

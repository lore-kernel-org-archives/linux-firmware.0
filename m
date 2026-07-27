Return-Path: <SRS0=nKvH=FV=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F393C53219
	for <linux-firmware@archiver.kernel.org>; Mon, 27 Jul 2026 07:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C2C381F00A3A; Mon, 27 Jul 2026 07:45:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785138309;
	b=CAvlVAMolRbiCjbH2DJXBpjsOR+kvxT6lkzBZJxNjqLrVHoLv7nxRPt1uDmrFGaVExeR
	 FMuRhLi4yw5V9yFMkuJs+2moD7G1TVjbUjXgxHDcZ9UIayhV85aldKlozUb0ItyuDVOBe
	 OApup2NWGEG5SJqaBcaPFKarrbmsTNFQ01mAT9HtOgr+kmr0vZ792ONVPOadC2H+SoFTs
	 nCTdf3AjAz8rt4rjKn1E36/yowpshXV1hw/5m+oV5iIuM7/kN6Qe8fyD4ztD67r4b3vDU
	 Q/oln+wP0KfWbK3ErFbAZRLHULYUSWTHWnNz4cmqqy1QFaniaTNtgmBljauP4NVOS6A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785138309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3ofL+/TcWIdkOBDiDW7UuPGSGWQex6bk78L2OHUvMYU=;
	b=2mJCp+kNdCCPhLKN4HKQqClLfc5oVjWtO3G1WRKFCYrRyvxkUj6LG4Rhh5q4FEGLxA6U
	 v1p8nrqUyX/srjrNmWQYH28hc1ODn6HMB/zAg0XoFzIC+EJmygpBoPxQGjmkqD3wTfVUd
	 ysOyRUM+/j6xSaGrkGLKaOst936cP+v1YAKg1aYGST9qz/B1KLKtfAnWFcT5UpID/R4j6
	 JKM3+NfBI+1qvtQAvFa5eHj/kzVFcpOqbuBNR3wohG49ybQRc1/vOZPl44WmJ4kh2vUg3
	 w14IqZLYha3Xo6edL4KPVrTdH7u54Qls0eZvqOmm+nfh0KQFQ10UCEnVgeytwbcKmjQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D61gByEl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R2EAGVb9;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 031761F000E9
	for <linux-firmware@kernel.org>; Mon, 27 Jul 2026 07:45:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D61gByEl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R2EAGVb9
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 031761F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7STiR2905271
	for <linux-firmware@kernel.org>; Mon, 27 Jul 2026 07:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3ofL+/TcWIdkOBDiDW7UuP
	GSGWQex6bk78L2OHUvMYU=; b=D61gByElYHLukzrNHrn1coLB8lzGDf6SM4yoBW
	qvWFBmQ4LTckTsGxrVAoCMvXdieMKMQenPUrwdYGbXVZ8aeu0xA7fY1yTfNYf9ja
	lFbrnjCdaLFsBfobtnB3/wP+1FoypKcPp87RvDsCqhuw/tPRa6q49OFPpfQJ4WTh
	1VntAh1pwS1krRmiMb0HYGyy8uew9dgmqC/Ge9Amal0iiZcGCgnkkt9cL7J8LDJq
	xJstpz3WYcwWvRcnGhmNOvuq0Pbm0KnwUAv2Rci+SxoF2XCCbQTgrGKmxhwLGnY7
	pa6pr8yRhfN/QFaV0UT1k11n3TKHbpLVXs8nI5v8nLSA8t7A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnh7w2nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 27 Jul 2026 07:45:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so46184395ad.1
        for <linux-firmware@kernel.org>; Mon, 27 Jul 2026 00:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785138306; x=1785743106; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ofL+/TcWIdkOBDiDW7UuPGSGWQex6bk78L2OHUvMYU=;
        b=R2EAGVb9iOhMTeCy7OKyWh9/350Jz1xSo/SCkdssL/CIUcVF6lS4G59+jxrr1rTT4V
         Sra65xFTSnKzHNdn5lMTJOwMNmJdF88NY757ldUtSBh+QQzfuQ0R2Z5Ijc6vspKAQ6WJ
         hirLRWpwT2tObLBTvAg5W6KHENrP3woLtrXhzavyJ+54nG7ekccIufzZBlmFmn348Ouo
         OOBY8sZZAPpZRn5AoUmgfGMNtZWbN6HMFQH6qM64Oy5+LA0ZUhOd+Cs0kdfk3VMoFeBa
         RkOpVlS9ywCv6jk3kKpdap6h1ri4RAAFKNm0DcgxUVKRa+Bc5BRJ8Vj0E2pWYAd42PEs
         /JNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138306; x=1785743106;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ofL+/TcWIdkOBDiDW7UuPGSGWQex6bk78L2OHUvMYU=;
        b=llJkvWn/e9GX+SvKOddvTq1xGVQCETWogTvQX49qpReq6YqKyxQNpW+2s7r91jGK2W
         amfGZeDMWU79TuAP94lRldLEZpwSYYXkncdBb2BEZv2hNCuUwVbRCLc4j77DgJxliu30
         YR6Zlhkvce4oCdMdBWXLQwV7Kcuevco02Qqnq3AzfC9qVDkMPV3pojsMPOIXdwwzoDny
         u3pH+z77rfedYl33JzJpArQTC8KlHPehNsIYpx0K5DcQpZzMLGpxsBA7XHPq3rLM4bNW
         vpLMEuyxuisuU+2nouzGzXVTIdi3aq0PXViyvfmikhs4lfVxlG+jJIY+p+D6z85PKsTa
         wNFQ==
X-Gm-Message-State: AOJu0YzR/FgdrOHaDczhm6ZVesr8NL1BJPNAUPP2tGAn+tj9Pu13YiQ8
	YSrlcM+2Uhq+6jUAqWieADwRw/JgBv+xcM8Ch/VD71/XwwRWLxw/r7fjBUsCl1H9sWeGGoLJNRV
	37mWv9kem4hT0es4zanNzyScXuHTtik0y36/MsYMaqoYmgY1b0lsos9D8KVHv4VVINoucnCY=
X-Gm-Gg: AR+sD117CzIYQUQvlR5nbBlDZe0wBcY9m1DfeyF3pLjd05sHKHn7XPNGmWSJqYAxUN+
	JwemwkXmgBGLHTk1fsvKuahVaEq39+3yzH9iSUdp1QS4+eVWwKBmpUi9Lxi8rvELEo2E/X0IVEl
	Qq4cMJ6nK0VovNPThota+Xf1kBCwtPcEwThnlFYOIghXPKdGTnrMzxrr9cCteCi2PBCPYuoFspO
	gPqKn3ruTdiio6nIFT1qFQKgjuBJMCqW8d8+lUUhoNcWRktsjUZ1f7mE/ed2FkPqZM92vmNqEuL
	f9SNh7QpAkSFNmMq0t6wjCCaqR+x0YqROJkwe2baHAh8YDtknPYmvT6HrNLs3OnHkjlpXYI4Tad
	sxBDfRM3hnK096rfSrwg+mfxFMCsrRw==
X-Received: by 2002:a05:6a21:730a:b0:3c4:2fe1:fa29 with SMTP id adf61e73a8af0-3c67dfeb608mr7507793637.59.1785138306468;
        Mon, 27 Jul 2026 00:45:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:730a:b0:3c4:2fe1:fa29 with SMTP id adf61e73a8af0-3c67dfeb608mr7507768637.59.1785138305951;
        Mon, 27 Jul 2026 00:45:05 -0700 (PDT)
Received: from [10.204.86.123] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66c80a7sm2833180a12.25.2026.07.27.00.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 00:45:05 -0700 (PDT)
Message-ID: <09a2e4a3-6177-4045-9214-cef696b12592@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 13:15:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for qcs8300 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iopXY_lR3hUJCVYMK-TPlF2SgdiTsZ2l
X-Proofpoint-GUID: iopXY_lR3hUJCVYMK-TPlF2SgdiTsZ2l
X-Authority-Analysis: v=2.4 cv=f/54wuyM c=1 sm=1 tr=0 ts=6a670c83 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qC_FGOx9AAAA:8 a=Ku9IOfwtBuEpKyCMheEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA3NSBTYWx0ZWRfX413pA02ilwSw
 knE+DR7fnrdnELdaDd5l2a3HRXskobM77aKHHFAvht9269P8QPgWXKqkPqfSUWywU9xvZPqpbgJ
 d+SMKKNSV9hHSnlNx6p436uDabnGhcJWPu9bCvDMhj6+yYIKeXhwjEZ2/6XLyI2RsraFiBCgj6r
 VI89uj14GlYcMScriQTXbHF1G4faL3qAUIbRoPGdo4rkKK6oA+g/paTnok5gs3unGARJ+Kk6ukH
 TAK1J7WSJFhB9l6zgLuo435jLJER/xjpvxyfehzcouiDcr8ObKB1osYXO8Tdj+RThTXmBDzzEZE
 Vf92TUjnoWJMXpAcZG6oZxFav6sFEjn+OrLaC6JTxZPSDvKKbTqXdlWB9FaY+SzNy3yc3M3Moo+
 IZP7dhqjVYoTAkbu/e9BYFE7hlIHmtU4zXXaugO/iT929Dv1lS37I7XAxOPPj8EGvmbBzx234QG
 AzusfyvWX77ai0tCncQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA3NSBTYWx0ZWRfX2Cda9wXQZp93
 zL+Yt9551nYHkGQt32PzttQw86LOIM+2wPwoAaSIU1IAe6teUH1FV4Eme2lpQEsTyOsVCSbmbBS
 J7EVZR5Q+qlUakDZ0FNeCTGn5EYDMJU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270075

The following changes since commit 924d73c9a2501a256d18a26cbe640548c70b3a9a:

   Merge branch 'robot/pr-0-1784191359' into 'main' (2026-07-16 10:39:46 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-monacodsp

for you to fetch changes up to b3a612782af5bea49ae6f0af6bfba6c4d7819797:

   qcom: Update DSP firmware for qcs8300 platform (2026-07-27 12:52:57 
+0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: Update DSP firmware for qcs8300 platform

  WHENCE                  |   6 +++---
  qcom/qcs8300/adsp.mbn   | Bin 6803456 -> 6803456 bytes
  qcom/qcs8300/cdsp0.mbn  | Bin 3178496 -> 3178496 bytes
  qcom/qcs8300/gpdsp0.mbn | Bin 5996544 -> 5996544 bytes
  4 files changed, 3 insertions(+), 3 deletions(-)

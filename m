Return-Path: <SRS0=mZhp=HV=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996CEC9832A
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Sep 2026 06:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 566B81F00893; Tue, 29 Sep 2026 06:50:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790664605;
	b=rDd22EJ0w84sHIeFWsgU2rTxqdIRHxNEK9JYfP/1wz/4Cuna42Iulddd/009o5BY4OFh
	 lTN6E9tAUhxhsIVww8R91ukiFTDdJ+O9sEnhyJDzpEc58UegEkEuOeMP/ddk3y9hwvfKm
	 6PewZS9b9Jmef4aLCugPLPDg7p1292kXgq+QXqb1H7iw+rS9SZ+isdyUzl7/jHwUd0SrV
	 3BvujSgHTpNBO31Tg4HmyY51X9JBht1FR+gQawVehcN9eNmQTThcIl/zMBmXe68ZOPIgM
	 kqq5BNJJySYtDIR8m6Vj8nF18umfyHqpiZZi1qIEv+gUaMKF+UnDWENLopSXkH4WLtw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790664605;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Content-Language:List-Id:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oGx3wDJkubD58l2q465mId5OWzwirczF6QwiOAON8rg=;
	b=XoIpxInnES9jBcKwNQ1yQvoqlhTa4IE/VhiZc3VI2fMhEtYJ0BVzpvJ2cSEFh7ilskBj
	 TgXf56m1ggPpLIMB4XNNbZqKxl8lZel/boCDesmjRA6D/NitkBqh1ECMRDkYZMy6qqVio
	 3vzO2b709RXUzNlaiqsMEpAgstY+XeGUUZq/2a/rwjGrzJbt3QEtV3BRMWj90Fs1C5qMk
	 3sIotVUdbAvV/FoB41sJ0WhekmrdRVYRhKudeEX3pbQ1HQ6PQPr9DeZI2bLV4tp717PI9
	 g1Wpu8NWprwiRMQMvV2kIXY4PdLMN/yD820mAK1uR0019AmhiykqLz6ybndWPsr2uhw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="XrkIz0L/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ta/Lcaio";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 983F41F000FF
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 06:50:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XrkIz0L/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ta/Lcaio
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 983F41F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47LkS3241691
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 06:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oGx3wDJkubD58l2q465mId
	5OWzwirczF6QwiOAON8rg=; b=XrkIz0L/cg2jA+UFCe2JdS0AzBkZ9O8uC/okCL
	uTgcPqO8BFnY+olvx3Ja3omdZNYhsbAZANalSUzzxqDc9QYbqSF6fpi/Zlb28Pf+
	jHTJ6gCzK7Gva2imD0H8WY2kWsDJTUHVn2S+cYzaTJZlaCKXO8C02SNT6VYWKdg0
	8anltdIXyuocjG/iZuGjCNoZM8vX/PALuvfsZWxqpeoWF2N9r4Ya7KUr83iW8pqn
	dG3sK5XBXKZdcLZKXJMC7cNZ0d+Cc3rVqBYpNVbv4q1Z9G6hWl5Ar8VaF5Jl6cjI
	jvrOvoSYVw1VpulzlwVR/vWbKYXTCwTxm8rCszQtL5N4RHTA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144sj4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 06:50:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a470ead068so1416675a91.3
        for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 23:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790664603; x=1791269403; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oGx3wDJkubD58l2q465mId5OWzwirczF6QwiOAON8rg=;
        b=Ta/LcaioIZxBq8UjjA3Qg2sKIy7uexNnGML66ahLZfoC0ycaf9BM1MhPQcRdBljDrf
         s1kZi4HCioTiSCSpi4RYoGYwAbO4OQh2hqF9V8Mpfi6JgD9DXAT2g70wlc+Sj8rRvbGg
         hOXPQz9qWuTU2OALKDQ/pESdWZcI2cLB9iidIqXog1RvbVM2E1QS2pFyDoMp82bDIvgI
         bsZ/ET2Rsr96ysY/4FsUOcLJ5HYLmmuAu94kMIPCCo5BkwD1hMWS5jXF9SujLBOpnXQR
         vEp6JdV4rY62awo35Za3M4+hEi14KBim8fg71cTf2nc8R3xTtby4UA1AUkMMY8N0bUMM
         ixHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664603; x=1791269403;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oGx3wDJkubD58l2q465mId5OWzwirczF6QwiOAON8rg=;
        b=OlUM5nQrWlN9C4pNgL9TFrmWkvEJiY+f9YA5LnkeHoi0WTtUUwRM4Ft9kqIhzSToyS
         V05jspmpeI4rLC1rVq+pD0omnY8jm98/TE5HzJtoIng4gOUBWspREpfqtowmgXy0I1X3
         IL+1ZPH1MNm+zUPPxr2dUGlcMBHmfOcUqFdbfLq3DnsxzFB3nqkVdr89V9DTyvMu3zry
         vfDSt94jDbtt6MaIiIBOOvUUepKqLPP/w19VWxyVIdMRxI+AsAXWG8tcp7+vJTm4nBjZ
         a5R86tTrBj8m+eBVsU5kxuMoT+QUXg+dnkE1ri1Xq8RLCy2VtYenO08CN/xvve+P1z7h
         HoEQ==
X-Forwarded-Encrypted: i=1; AKwUvByMJkTya9sALjX/TVhozo97++29Ouf4fKXT/dfLXnl+NA/zwSXt/X2nyvu/6P578b3LUgSGZd0zIaY0Xp/sDg==@kernel.org
X-Gm-Message-State: AFq9FYJ1ShtBeHg9PArRN2EClu423jbcrPOjaQfIvkU6fAo/p5HIKyPx
	0UeZ93XRHHeKpUWS7IKbqZIxvvF5mjJu4ce/e0iM7QPE//oCsWtdH9w36dnxnRT6Zyg6Xln+iux
	8DSSSNBx2voKSbbnh6I/qYxTk0ZmJYFZGNEfKL7RPprCnoaQGoXrqHZyW/z4nO8E=
X-Gm-Gg: AYBFou1TQsH7CX8JraybQgRAtSH9ClWRQ9R4+K/shzacS7Rt96V1hXgho1DSUhHMuA6
	MSs2nptp1jps7wl7qx/PMIlNyv9c4ecOK8DDneJbzY/5/1aOSIoX//JI7YvaqOx7FctlBhpQKbz
	JKDBuy/m2EA3TzSWPO4X2lfGSphFpc19Uu/G+OZH1ml8Vclqiia5mcrje7ojscNeOtCC5w3Gbr9
	8bWJFFXWjktmH75ktnCe13psaS78w8dp/9tsQQ2OT24Oqf6z/xZIoLmI0Clw1tRtuBLecEO2vNY
	Mm+MIEpIIkWqpVd9cgjzS5LURn7wWl+1j/9RkkkzpkLtX5VKHpXighEEAnd0Tx9hW/62FpmehUR
	mUNOrWvdWwQ1rJLADMNK8IBe5FG/n/w==
X-Received: by 2002:a17:90b:5410:b0:3a0:ac34:f7be with SMTP id 98e67ed59e1d1-3a0ac34fc4dmr8832390a91.4.1790664602627;
        Mon, 28 Sep 2026 23:50:02 -0700 (PDT)
X-Received: by 2002:a17:90b:5410:b0:3a0:ac34:f7be with SMTP id 98e67ed59e1d1-3a0ac34fc4dmr8832385a91.4.1790664602127;
        Mon, 28 Sep 2026 23:50:02 -0700 (PDT)
Received: from [10.219.56.173] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498caf134sm1472398a91.3.2026.09.28.23.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:50:01 -0700 (PDT)
Message-ID: <5febb66a-7748-4cd6-bd29-e7d3fc480115@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:19:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: add ADSP firmware for eliza platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfXwXA46GKZBlC5
 8fPbKhrQyznK30NUG6EsVI5pIgsBC3ymtTb+Jzj14Qam7JsfvlsGcEsd+YSl1sg7FgcfZv5fkTy
 UtmNpJF1KnWKFXigPSlGtX04SdDsWAnbmOfr7QBbQfr/WsSorQowupds0Do5NmdqP4BUWmvy963
 3OJEQ3VHj2aRAUR5ssrTzfMsO6F/KvVMzId84FXst/Xz9J9IEhMHXAYA33Sj7Fuo3dJp/SbvLqz
 4RBuD5ujVNA21KnOVBK5/HU8GULhgRPI5ATi9vMP7CqKvKhDmVw3Esihhdtr0bKurh2YM0jpNx1
 mE6RXCvH/k8+GwXXI+7y+BYuLKXFseUomDaOGm+EtVkcfWRzQgNy76HHEHAnSw9WOFpkqwIUTAO
 IXZyaLne0Xi2cyQijuBbLCeEP5Dkoazm0bSg9sOL9e3nRh7raswgDTLX2y45Oyh7EmRZRSzufkM
 eycoAvtjGa49xVypmMA==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb5f9b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qC_FGOx9AAAA:8 a=IYvQtGcTgBOy-2pnBSAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: Wuz4pl1fVhaSoA5J54ErggTwMqVvD23O
X-Proofpoint-GUID: Wuz4pl1fVhaSoA5J54ErggTwMqVvD23O
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX894ClE70kg/c
 yoBE8lfD91aDnt/heeqmYaAxZQ9ZsK7IlyOUDxH9grxrjJfplcF9f9GbWpMMx4BawFgGK7FGoaj
 JqHNWCWZAVg3/Eo8kDJeZvEjUU1oldM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290027

The following changes since commit 58a9869598b606fc2e5531298932b8757292f9a0:

   Merge branch 'robot/pr-0-1790653747' into 'main' (2026-09-29 04:30:30 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-elizaadsp

for you to fetch changes up to c8efd19ed5513938026e510f727d1b45dc2a257a:

   qcom: add ADSP firmware for eliza platform (2026-09-29 12:17:57 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: add ADSP firmware for eliza platform

  WHENCE                  |   6 ++++++
  qcom/eliza/adsp.mbn     | Bin 0 -> 15640632 bytes
  qcom/eliza/adsp_dtb.mbn | Bin 0 -> 151352 bytes
  qcom/eliza/adspr.jsn    |  22 ++++++++++++++++++++++
  qcom/eliza/adsps.jsn    |  22 ++++++++++++++++++++++
  qcom/eliza/adspua.jsn   |  29 +++++++++++++++++++++++++++++
  6 files changed, 79 insertions(+)
  create mode 100644 qcom/eliza/adsp.mbn
  create mode 100644 qcom/eliza/adsp_dtb.mbn
  create mode 100644 qcom/eliza/adspr.jsn
  create mode 100644 qcom/eliza/adsps.jsn
  create mode 100644 qcom/eliza/adspua.jsn

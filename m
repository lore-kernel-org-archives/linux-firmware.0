Return-Path: <SRS0=L3SC=GK=oss.qualcomm.com=xueyao.an@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C6FC5DF70
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Aug 2026 09:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 220931F00A3A; Mon, 17 Aug 2026 09:26:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786958776;
	b=Nio1HgBAANR0tNhjYq/dvagl3WAdvzX6pXYsMEZsLE14w3vyhXaPVZzXAPWiF22Dwg5d
	 a0YLzeYzf/MpYMZkeM2qacgml1e/tSlrQrtacXgnfNZmUCW9UaAlw+lBWTovnMvm9dlPE
	 C6MT29frho79LWWSuRssE32Ty5AwSb36mB2agEipmMEvFh6r6UU6vFVqpq6w8fm5fnjst
	 mqFIMl/bH2gu3YLZusWKj+M7+qyyau52G+YaDm+yX/NyzBx23vCoplsgeilC9Mc6FlRc/
	 Rn++yP1LUb0U62TNF2Z64jTTx/x5M83a8ME5UBIAdEBk/C1cohGp4W+GCW38i2XC6nA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786958776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1zemRnj2NA9+WLI5o4tUHy4Rt3WbgNun+YNI+k6gkbE=;
	b=KgPx5caKD+SIeTeu229TMKEfse6A9spAJlk9io8t2Ab7aLKAFw+3F/xDktOGpw2S43cQ
	 HbqT+okdupixsmNK8j/0tmAUOxD/6YwNJfTp6ATj8CiZAVsI2wfBareac13zGMHWQnXoH
	 rysohdsGIoDdhP2PceqBRHqY0Uv7A3FbnBIZNE+jHnyqNY1n6g1pdi7Ka7a+wzzQpSYVP
	 l4TlZYJYg79jnVvGUTGGnZFmxMZRRVdcWmAJhtFo1+BtmAjiDh5o6LPkU1K4w6flymKfD
	 A8goguyCDmk/ZjSgJ7ZDcbQ+HwrLsdvPCe7WsHLCBL97++3EwU0BmmJmXvK0WbOgZuQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sr46nG5l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iG8lO+a6;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 676E71F000E9
	for <linux-firmware@kernel.org>; Mon, 17 Aug 2026 09:26:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sr46nG5l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iG8lO+a6
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 676E71F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H8t6WL2177260
	for <linux-firmware@kernel.org>; Mon, 17 Aug 2026 09:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1zemRnj2NA9+WLI5o4tUHy
	4Rt3WbgNun+YNI+k6gkbE=; b=Sr46nG5lhbxVZXRK7mDWYeuz4z3A/W4Nt7BZDu
	mTdB6eRgKvFpw5IRzympB/oBwnIQD4bT3DvN1/1KTPypbO51suRzKfHSRX1WZ0oE
	3ZTkEjDq9WDnwcfMN9JCUfalmivwwH5W2bRPYyCark6EbpPYkmkoIPyEGOk++VHy
	n/VcMVbRelcq2brk1BB4HPtCebWbtwrzpbjvsOsY/TT/oySHpO9Wc40E1WZ+ltIQ
	yE9c1et3lF3q4JE03SZE4ymj7pdiRvkTnfxAJ0BXcpF5S0lCpvapmrwCktjOTpqO
	CD8wHNfrJ28GGjFtDESjT2b2ZdhsxllBpIVhbIHHqxaiJtDQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7784s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 17 Aug 2026 09:26:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbef1d25500so3320940a12.1
        for <linux-firmware@kernel.org>; Mon, 17 Aug 2026 02:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786958773; x=1787563573; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zemRnj2NA9+WLI5o4tUHy4Rt3WbgNun+YNI+k6gkbE=;
        b=iG8lO+a6PcKYYqY5VJqenlAVzPFaQyJPMFMV8dcb98E0xbwqSOCaFnWSQiOm+vWMt0
         rPO1Ldr4rFBeR9uDVrjUreM5ZsFbNvgUL0+U4h8L2b/ISnvZ8ofr0M5nTYC2U1N5l0Bt
         JkuGY7x5lmAiF0F3984h6hDHia9Q2jzSFPOzxUUnazoT6kpsP/dZR2tViR7vRTQ4B0N8
         Fa0OGn7XtmnpmFWGMp4qCghHFn37jZ9rWzEvIZzaHLGXTI4CzMDjKlW0h39gBMB8V6Ya
         v9vWoDCZIq/h8v0cYUnqoNIPJtH4UCbH2wsmqpOyFVXzWup7OTJIcMAos7CfiVonJAkr
         EgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786958773; x=1787563573;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zemRnj2NA9+WLI5o4tUHy4Rt3WbgNun+YNI+k6gkbE=;
        b=rEOfis4f327VY0iO6QC50bDmxg9Q2fiTxu0lJvFNE+6BkwG/Dd5Gexaj+5S8RxvclL
         Q/S4Z6pG91wYuVzfkiXC9yXpZkc1/DSOeGYkmfqwU0jNHjt/EhJNGNAcVFTwppsPMP9s
         YLf/RAeUhu6mChYh2Sjt/WslWbEp926S4I65bDhhPE85+v6SsbQsyR1pHErVjda/CcXa
         0/g2TJTi2JOO3Jx635SzfdJMgQBKjtlruaAYDWfkHhCJLqywyDyEmR20ApbhxHIrhUKB
         5b4gohbiDr6hUWHk3QNspPoGDAnACw+8DOU0NinzvbiSl64qYNygBruzav4jTY7pVuYY
         ijmA==
X-Gm-Message-State: AOJu0YzU3jQ+4EH+kTbRHXQ8vTn8nQUe0pgK/oX8/ib1M2uuSGtUCfiy
	CnVRM6TfiOU8bGSypo8fOt3DAC90gGY6FYzNLkAHg6PjMTkOqO3AifqBE8NK+QXZCauewkWIce4
	bmxEVjxwDOChsAhJNnJsFs8R/+3Mu78zgMjFxPBpFjdmifixY4vnBH6TOLEoYTv/qrcNdHhM=
X-Gm-Gg: AR+sD13mbQMdXNu+n3LwDPNhxC1r122e4sQv11gqmtOGpyu4DSupB7r+etZIU1S9JQq
	Jhcmm09CaS//s4j0hoVTwP6atReSNl9dhrdOt1SkaEZbkSxKkrgo9QJcL74Ul+ysgE4IVeuAeLZ
	v0lqceW6okq8PLMvAFKgesbtViwiFyH2AvQUbQyIzoia7ox+MhjbCxoQIvGtr58F9fDdXRe2xJH
	BH2X4b//zvglBs+HlqW+Flh04gKNbNIEcDGzpeSnN3XTFe0hOdyG22iu/+xuZm8z2cl+RZfXUti
	P6iCVznHHn+WVuiWpaneHT32VRqd0PF2bKitUSgWUS5ztc7gKTKA2WfAnjOa8JyQAghRanMgdwi
	hrj9vy3aIgO/OmZtmLI9a5SJvFpFVqgPz4a4Uwd/Z8LNxkcAdH3LXrNPEK/oK5oQxXJc=
X-Received: by 2002:a05:6a00:2e07:b0:848:4a48:9f9f with SMTP id d2e1a72fcca58-84fde2cde8dmr19760628b3a.34.1786958772773;
        Mon, 17 Aug 2026 02:26:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e07:b0:848:4a48:9f9f with SMTP id d2e1a72fcca58-84fde2cde8dmr19760600b3a.34.1786958772278;
        Mon, 17 Aug 2026 02:26:12 -0700 (PDT)
Received: from [10.133.33.77] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13bf26a0esm425754a12.8.2026.08.17.02.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 02:26:11 -0700 (PDT)
Message-ID: <36e1b825-7896-4308-bcee-f695149b3c0b@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 17:26:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: viken.dadhaniya@oss.qualcomm.com,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
From: Xueyao An <xueyao.an@oss.qualcomm.com>
Subject: Nord Linux-firmware: qupv3fw.elf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA3MCBTYWx0ZWRfX3V/kc9ZSu/Sr
 QgxA0XNjECoCwcNYyeUYIIe7H9DEGeNNAm7zzXEXi4JQlCpeHjFD++n5O8Wy87H1PRO7TEU20JX
 1q9tjiDJdssVkebrrK/SICrgEJKphAYt8GB9vMfEOPzbkXjohQTseRsLQtIsn7od2a6nyoH3QHe
 uDpfIUJC4jNjc1Foiolj+CbmNK94q7O9/kAP0iVpEdYKL/0QFnOc0WGuSnCYuZlKWkG5WPqiWn9
 giigmWKz36VPNIZ+JPRz6Jh5DYjWiZnQ6rq0Oy04aA6y4ZeHfDAvkmGqFIAWvPX5JKOiSXCNiln
 XpsWRccqCSOf60Cejas40+qgBlDrfuEVNNnY9RwmQATKA5cY0pTwz7v+1rz8guW6MhtHPH0+XIS
 vpXp8sLj+KCGH/8S3DakFAsLBF17PvvLIj7MXkMwezPVSk/kXdcMKAE/8XaasqXI4KKnVLr0Kqh
 F1hdKTcu6o4VyOyLOHQ==
X-Proofpoint-ORIG-GUID: -FaffU5lcyNz6_5j-u8Qwl_qfhVD7SGU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA3MCBTYWx0ZWRfX2NIx6npAWUp+
 zVqmsFxQPyhBpXvdEc/j87XF7i5borpkdgwagpUxSOhzNeA7SUUxaucyBSfKY7De3HmGg2uPmxs
 zTuKxPirp7T5fXNwqNO/QPFOU6RPbSA=
X-Proofpoint-GUID: -FaffU5lcyNz6_5j-u8Qwl_qfhVD7SGU
X-Authority-Analysis: v=2.4 cv=WNhPmHsR c=1 sm=1 tr=0 ts=6a82d3b5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qC_FGOx9AAAA:8 a=CL3Ls6F1XLulrIJUaR8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170070

The following changes since commit 583d336ee7c2a15fd9e92c223b147d30737ec04f:

   Merge branch 'intel/guc-v70600' into 'main' (2026-04-02 18:58:02 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qupv3-fw-nord

for you to fetch changes up to 2434f94d8934bfbf450d7b2d2e8d0cdf6dedc753:

   qcom: add QUPv3 firmware for nord (2026-08-17 15:49:52 +0800)

----------------------------------------------------------------
Xueyao An (1):
       qcom: add QUPv3 firmware for nord

  WHENCE                |   1 +
  qcom/nord/qupv3fw.elf | Bin 0 -> 61516 bytes
  2 files changed, 1 insertion(+)
  create mode 100644 qcom/nord/qupv3fw.elf


Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98027606A31E
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Oct 2026 19:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fWlIpygL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYkjq8a3
Received: by smtp.kernel.org (Postfix)
	id 938F61F000C2; Wed, 21 Oct 2026 19:22:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792610555;
	b=jedmOQ8bLQMbisIKo8SwGlJiicBUtRFcl2QkESYbTUKvL9k/XUePUzGHmS0VnTdD7xNq
	 E0Ig71pWrNioBtMV2xx3LfXb1m8/E8oiSfwyl/2IaGSA6HpeSxz8bajonvRThx6BjfyCS
	 Dsf0gtybS0GmOliTXokkav/tEQBhsZuRON5yffodxfPYh9c1kmjTBNPKNWXuNBk0+HEyF
	 +eLH+FlMyV/RFxJJ+3SooAXVsti45+ko/X9Mo1W5zh7uA8skiAtj5AFrHswVlw014BQsb
	 /cKE8MAWFmL4Xtz9QTN2cWO8ucjFa1MVBa6dmfPAHV8wrhVTRra+6D7562owEw6oRYw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1Ja/RaJywTxodn3bY0/vhCvYes9knK3EI9w9v4wVfFc=;
	b=b0rgXa53U2IrSlQdnTsGnFKnm6WMrD/iBpuA2yUo8eL9Ltdm1Uk0KPe95CtOpUsf826+
	 dfbnmRTHhDISIDmtWhOi/91c1piVRfzCeNE1W381zyIlKjLrFCmZcd7xJUZ4cjc3359oa
	 ZxrwsQJM19paLtUKgB+tsRIol/PIK+PVnOo50TwdtTvQoaKbAdYInQDnMO8IIPOsJtoNI
	 khPBXAsFi79NSWH3u80x2rVQb24BH2iYCybku6yRcsNQJRqMN+CvosHnYnhdMI1U9K3xE
	 ZSOlpUISgXPFjZnVMn4UPq9AFESMLUmNUrSnj3g+NcusEPxq45owrKL9G5GJ2+w8ACQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fWlIpygL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYkjq8a3;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8F8D1F000C1
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 19:22:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fWlIpygL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYkjq8a3
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E8F8D1F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LHpJ671359538
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 19:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1Ja/RaJywTxodn3bY0/vhC
	vYes9knK3EI9w9v4wVfFc=; b=fWlIpygLIs68VDyk9ZHYeYeTmB4GtVF1rbu/3W
	Cr3/cBFwI0cZEwxdbsy9t3hqdIS7F++KuCcpbxjwm2diV6divQXznHfKP2WOdDkP
	sRza4GqywHnDGfDW33HfeaAu/Hh8B5e7/H1xdikfFNat8unJ01NvQoDmTGzkxyZq
	OGdrcjJuZhwtwS8NwE1AlyM8TP1wjJQ+spg0sKYUwrnp7kHm5AwxQ3YboVxKcYkI
	V75m42wr2qGMsKd4h3wobNo3yeqf+o2/HNXWgqwGCpbWO59TTfVQvg9uliTgMlD6
	RTbq+5Mzeehk7lmur/dJK9vzPBSigHGekiiAFV/U/hSFRv2w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj4af67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 19:22:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35fb6be0fcfso168811eec.0
        for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 12:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792610553; x=1793215353; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1Ja/RaJywTxodn3bY0/vhCvYes9knK3EI9w9v4wVfFc=;
        b=GYkjq8a3HMiqfpqRv+bePPRrG4LI+SJN9Q3xoaT5wQThBt90DcZJhwZMogDvJHIjFB
         yCsiGArSWjIbrGiQNCYKmnvc25p7i0eifhZKJP7RZ0ZcyakPauX+4K95IDnxD5CEoRfA
         KwTLUOphjAQsGfrGxsMDmw8yr4AucACw7NJh/+mR0NJ9sqySCjwyUNWaR6mjA4EOVZmP
         1VGF9OsXz25FgSamwcbuIKzX+GaS73enu8p5yMWCksrwnZ3ggES3lJiZuzkC+QIHqMLJ
         FKgnOsbEVLmpLFGn+Lzl/hGXzYBsy/vKggPaATyEF7+6xpLfML9tF/upuTqCDsG9IyxB
         OVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792610553; x=1793215353;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Ja/RaJywTxodn3bY0/vhCvYes9knK3EI9w9v4wVfFc=;
        b=GfLDsfCL7YVsQ+ftS2RBE+2elPGMY1F9foubPUYGUoHmh93J+STe/xyhHPXnc/pgEB
         0DOiDCy/AzAdR3jvygq7aGGkgfC35dz02Rc7vnifSN2Zcg310d32sJ+b3lm8TIXM/SVH
         eD+dXSBeC3bQ4K9C3xZFKiwDz3RvzAQpVRPVG0f6dK339jl5qYbSoP1jREL4po17+JwY
         86LdbvA1nbxYQbSxdfN/mJZ6bQq5x9az+pHORNEgNGwFu5Anp95zVdSNOdig8YH5QQvP
         VewcuwJFXMSG9Lv51J0cqedrwA//rf3hPDumAECCNQneomtow3oDt5sGHpHR2PQpin85
         XZ8A==
X-Gm-Message-State: AFq9FYLhjLmFF+D52FAkCC2kKvLyDSMKcUJweCmmeCnfaI4MLNGQJ6r3
	vCGEeba0V1mkx53konsxubhYPrB/aWpfrvDS42oA0JmU+bivOGdd9t6cdkaMs7x+61l8Ebv0jId
	GtDno9BKmpRP9E8A6AxUcsYyiGtx1a1smLkUY1RdsyS9asge4m1cRuRPqzmBs2LBG80jPxrc=
X-Gm-Gg: AYBFou0/bMcZA55pgXxo1stAWellVsK1IwobvlYG/DcmLQKp/ocAmLHVD0OruhwUoBU
	X4DGJ/7i5dTx1SwEYptwJoTkcHFT6auIHyK20iL5V1SVEKhSDci69LD2LSP6F462hM9fD73haZ3
	czuMQnzfUIorARGeK8MBz5eDTH482MDbMHtPEw5Ghp0rx61tZuNEfcpDycQu24umtvz5BnKAHlB
	UWx5BvIZypCra4+oROM5pO1NV424vyiT5pUTJ1e3lZBUSdH0bCwElnPobUOfJf29c7Lfx35TWOK
	IXpzjLSzUkSW+nSvOFkm9/ZtXLlcGLvkpemI/bd2FSavaLG36i7FtFoAdEWKmzTl3iXtL8eXh06
	O6AL4WGnFwJt4FT/Uxhd79M1RLdvy8yQ18Ls=
X-Received: by 2002:a05:7301:6192:20b0:33e:6714:3945 with SMTP id 5a478bee46e88-3674c43a7dfmr6478908eec.2.1792610553313;
        Wed, 21 Oct 2026 12:22:33 -0700 (PDT)
X-Received: by 2002:a05:7301:6192:20b0:33e:6714:3945 with SMTP id 5a478bee46e88-3674c43a7dfmr6478863eec.2.1792610552579;
        Wed, 21 Oct 2026 12:22:32 -0700 (PDT)
Received: from [192.168.29.174] ([49.43.218.68])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411bd2a6sm14400433eec.18.2026.10.21.12.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 12:22:32 -0700 (PDT)
Message-ID: <aacbb97f-53e1-496e-81fc-2b5674c00373@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 00:52:28 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>
From: Puranam Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Subject: [GIT PULL] qcom: GPU firmwares for Nord chipset
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: udJ5hkCK9RHIIS4sfa7axnWwPzl6jZGR
X-Proofpoint-GUID: udJ5hkCK9RHIIS4sfa7axnWwPzl6jZGR
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad910fa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=79FeU1Zu3aKKge9NKNQKpw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qC_FGOx9AAAA:8 a=TNXLwIv9wJP6ykvyZfAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3NyBTYWx0ZWRfX5eIrfZQO9fHo
 DH4irQ7XCHx4DLK1FBITfYas1Z1U/bjP/VoRt5B3UGWpPWMVq5XY2BLHAeZaEVcE7+EztNnZEB6
 MVfIvNFsBbGaqIuDFUQxQExfqHERPDp0eU+fwOSJ7xZNa5FWiCMbd0WZq1t5ySmvj2MQj+7Lncu
 pcUJqqhDJV7yp5oLIcIArNL2XIX95zhf4IUuA4jnT2604psXcCpWatAAj70t+xvvOaZN1ndD+WG
 9pZxLuPrUSJPXIy7C1q7z+4vrQoQor83uyo7Ycmp7P5jCaHXojL05M9+BbaTnjf9+KY0m7QgKV6
 zclXrFBdAFRTnqYGDIZDgAFrBUm1ErRgPZ/eKcKGa3jCH4F0/SD6N5k3/u0BgIz/SXgEqcEms/0
 hZZyRXeHWfSAfMP+EE7zDKdXAy7vQP67fNCy2KliRBP/fMVTNchCz8CKhWKVQdvniVZSS2NK9eh
 nYAurPxGbM5UlsVvhMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3NyBTYWx0ZWRfX6t0VemjVjPzG
 0HRpSrRCJsGUTbcPoRqM0eYUenpgFaQdw+Aspq7Gg2m9fxZhzRM20HcPB8qrYMD4e0hQc2f2RtW
 NfPkt+s/S2xbnq2/E9Ofzr8rI+P0Jd4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210077
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Please pull the gpu firmwares required for Qualcomm's Nord chipset.

-Tejaswi

---
The following changes since commit 59f9fc2ef8d1e312d2a613d4e1ffad2ff31a0a01:                                                                                                                   

  Merge branch 'qcom-fw-version-qca-path' into 'main' (2026-10-21 14:46:20 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-nord1

for you to fetch changes up to 0bee5f744b964755f446bc2b1afe30b598d97325:

  qcom: Add gpu firmwares for Nord chipset (2026-10-21 23:44:31 +0530)

----------------------------------------------------------------
Puranam V G Tejaswi (1):
      qcom: Add gpu firmwares for Nord chipset

 WHENCE                     |  13 +++++++++++++
 qcom/gen71300_gmu.bin      | Bin 0 -> 79956 bytes
 qcom/gen71300_sqe.fw       | Bin 0 -> 85684 bytes
 qcom/gen71600_gmu.bin      | Bin 0 -> 81824 bytes
 qcom/gen71600_sqe.fw       | Bin 0 -> 67700 bytes
 qcom/nord/gen71300_zap.mbn | Bin 0 -> 12288 bytes
 qcom/nord/gen71600_zap.mbn | Bin 0 -> 12288 bytes
 7 files changed, 13 insertions(+)
 create mode 100644 qcom/gen71300_gmu.bin
 create mode 100644 qcom/gen71300_sqe.fw
 create mode 100644 qcom/gen71600_gmu.bin
 create mode 100644 qcom/gen71600_sqe.fw
 create mode 100644 qcom/nord/gen71300_zap.mbn
 create mode 100644 qcom/nord/gen71600_zap.mbn

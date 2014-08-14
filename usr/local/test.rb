#!/usr/bin/env ruby

emails = {
    "woralelandia" => [
        "renich@woralelandia.com",
        "renich@woralelandia.com"
    ],
    "evalinux" => [
        "renich@evalinux.com",
        "renich@evalinux.com"
    ]
}

sent = {
    "woralelandia" => [
        "renich@woralelandia.com"
    ]
}

emails.each_key { |k|
    if sent.has_key?( k )
        sent[ k ].each { |s|
            emails[ k.to_s ].delete( s )
        }
    end

    emails.delete( k ) if emails[ k ].empty?

}

cat = emails.shift
p cat

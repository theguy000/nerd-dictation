.PHONY: deb clean

deb:
	dpkg-buildpackage -us -uc -b

clean:
	# Clean Debian artifacts
	dh_clean || true
	rm -f ../nerd-dictation_*.deb ../nerd-dictation_*.buildinfo ../nerd-dictation_*.changes
	# Add other project-specific clean commands if needed
